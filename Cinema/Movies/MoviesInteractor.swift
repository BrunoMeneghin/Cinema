//
//  MoviesInteractor.swift
//  Cinema
//
//  Created by Bruno Meneghin on 10/08/21.
//

import Foundation

protocol MoviesInteractorProtocol {
    var moviesPresenter: MoviesPresenterProtocol? { get set }
    var setupURL: String { get set }

    func getMovies()
}

class MoviesInteractor: MoviesInteractorProtocol {
    var moviesPresenter: MoviesPresenterProtocol?
    lazy var setupURL: String = "\(API.URL.base)\(API.Path.nowPlaying)\(API.Region.country)"

    func getMovies() {
        guard let url = URL(string: setupURL) else { return }
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard error == nil,
                  let data = data,
                  let httpURLResponse = response as? HTTPURLResponse,
                  let entity = try? JSONDecoder().decode(MovieCatalog.self, from: data)
            else { return }

            switch httpURLResponse.statusCode {
            case 200...299: self?.moviesPresenter?.fetchMoviesInteractor(.success(entity.results))
            case 400...499: self?.moviesPresenter?.fetchMoviesInteractor(.failure(.clientError))
            case 500...599: self?.moviesPresenter?.fetchMoviesInteractor(.failure(.serverError))
            default: break
            }
        }.resume()
    }
}
