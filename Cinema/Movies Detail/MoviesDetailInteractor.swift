//
//  MoviesDetailInteractor.swift
//  Cinema
//
//  Created by Bruno Meneghin on 12/08/21.
//

import UIKit

protocol MoviesDetailInteractorProtocol {
    var moviesDetailPresenter: MoviesDetailPresenterProtocol? { get set }
    func getMovieDetails()
}

class MoviesDetailInteractor: MoviesDetailInteractorProtocol {
    var moviesDetailPresenter: MoviesDetailPresenterProtocol?

    func getMovieDetails() {
        moviesDetailPresenter?.fetchDetailMoviesInteractor()
    }
}
