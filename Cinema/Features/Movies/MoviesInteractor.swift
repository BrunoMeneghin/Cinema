//
//  MoviesInteractor.swift
//  Cinema
//
//  Created by Bruno Meneghin on 10/08/21.
//

import Foundation

final class MoviesInteractor: MoviesInteractorProtocol {
    var moviesPresenter: MoviesPresenterProtocol?
  
    func getMovies() {
        _requestData.serviceRequest(with: .moviePath(.nowPlaying)) { [weak self] (result: Result<MovieCatalog?, HTTPClient>) in
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
