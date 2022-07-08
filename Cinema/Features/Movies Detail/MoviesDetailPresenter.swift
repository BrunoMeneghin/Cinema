//
//  MoviesDetailPresenter.swift
//  Cinema
//
//  Created by Bruno Meneghin on 12/08/21.
//

import UIKit

final class MoviesDetailPresenter: MoviesDetailPresenterProtocol {
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
