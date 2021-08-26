//
//  MoviesInteractor.swift
//  Cinema
//
//  Created by Bruno Meneghin on 10/08/21.
//

import Foundation

protocol MoviesInteractorProtocol {
    var moviesPresenter: MoviesPresenterProtocol? { get set }
    var fetchMovies: RequestData { get set }
    var setupURL: String { get set }

    func getMovies()
}

class MoviesInteractor: MoviesInteractorProtocol {
    var moviesPresenter: MoviesPresenterProtocol?
    lazy var fetchMovies = RequestData()
    lazy var setupURL: String = "\(API.URL.base)\(API.Path.nowPlaying)\(API.Region.country)"

    func getMovies() {
        guard let url = URL(string: setupURL) else { return }
        fetchMovies.serviceRequest(with: url) { [weak self] (result: Result<MovieCatalog?, HTTPClient>) in
            switch result {
            case .success(let movies):
                guard let _m = movies else { break }
                self?.moviesPresenter?.fetchMoviesInteractor(.success(_m.results))
            case .failure(let err):
                self?.moviesPresenter?.fetchMoviesInteractor(.failure(err))
            }
        }
    }
}
