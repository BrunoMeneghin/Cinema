//
//  MoviesDetailProtocols.swift
//  Cinema
//
//  Created by Bruno Meneghin on 07/07/22.
//

import Foundation

protocol MoviesDetailViewProtocol {
    var decorateMoviesDetail: DecorateMoviesDetailLayout { get set }
    var moviesDetailPresenter: MoviesDetailPresenterProtocol? { get set }
    var movieAttributeDetailDelegate: MoviesAttributesDetailProtocol? { get set }

    func updateMoviesDetail()
}

protocol MoviesDetailInteractorProtocol {
    var moviesDetailPresenter: MoviesDetailPresenterProtocol? { get set }
    
    func getMovieDetails()
}

protocol MoviesDetailPresenterProtocol {
    var moviesDetailView: MoviesDetailViewProtocol? { get set }
    var moviesDetailRouter: MoviesDetailRouterProtocol? { get set }
    var moviesDetailInteractor: MoviesDetailInteractorProtocol? { get set }

    func fetchDetailMoviesInteractor()
}

protocol MoviesDetailRouterProtocol {
    var entry: EntryPointMoviesDetail? { get }
    
    static func start() -> MoviesDetailRouterProtocol
}
