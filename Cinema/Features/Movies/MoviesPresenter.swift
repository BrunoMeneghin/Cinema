//
//  MoviesPresenter.swift
//  Cinema
//
//  Created by Bruno Meneghin on 10/08/21.
//

import Foundation

protocol MoviesPresenterProtocol {
    var moviesView: MoviesViewProtocol? { get set }
    var moviesRouter: MoviesRouterProtocol? { get set }
    var moviesInteractor: MoviesInteractorProtocol? { get set }

    func fetchMoviesInteractor(_ result: Result<[Movie]?, HTTPClient>)
}

class MoviesPresenter: MoviesPresenterProtocol {
    var moviesView: MoviesViewProtocol?
    var moviesRouter: MoviesRouterProtocol?
    var moviesInteractor: MoviesInteractorProtocol? {
        didSet {
            moviesInteractor?.getMovies()
        }
    }

    func fetchMoviesInteractor(_ result: Result<[Movie]?, HTTPClient>) {
        switch result {
        case .success(let movies):
            guard let movie = movies else { break }
            moviesView?.updateMovies(with: movie)
        case .failure(let err):
            moviesView?.updateMoviesWithErrorHandling(err)
        }
    }
}
