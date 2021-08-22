//
//  MoviesDetailPresenter.swift
//  Cinema
//
//  Created by Bruno Meneghin on 12/08/21.
//

import UIKit

protocol MoviesDetailPresenterProtocol {
    var moviesDetailView: MoviesDetailViewProtocol? { get set }
    var moviesDetailRouter: MoviesDetailRouterProtocol? { get set }
    var moviesDetailInteractor: MoviesDetailInteractorProtocol? { get set }

    func fetchDetailMoviesInteractor()
}

class MoviesDetailPresenter: MoviesDetailPresenterProtocol {
    var moviesDetailView: MoviesDetailViewProtocol?
    var moviesDetailRouter: MoviesDetailRouterProtocol?
    var moviesDetailInteractor: MoviesDetailInteractorProtocol? {
        didSet {
            moviesDetailInteractor?.getMovieDetails()
        }
    }

    func fetchDetailMoviesInteractor() {
        moviesDetailView?.updateMoviesDetail()
    }
}
