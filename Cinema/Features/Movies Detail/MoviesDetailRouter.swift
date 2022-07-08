//
//  MoviesDetailRouter.swift
//  Cinema
//
//  Created by Bruno Meneghin on 12/08/21.
//

import UIKit

typealias EntryPointMoviesDetail = MoviesDetailViewProtocol & UIViewController

final class MoviesDetailRouter: MoviesDetailRouterProtocol {
    var entry: EntryPointMoviesDetail?

    static func start() -> MoviesDetailRouterProtocol {
        let router = MoviesDetailRouter()

        var moviesDetailView: MoviesDetailViewProtocol = MoviesDetailViewController()
        var moviesDetailPresenter: MoviesDetailPresenterProtocol = MoviesDetailPresenter()
        var moviesDetailInteractor: MoviesDetailInteractorProtocol = MoviesDetailInteractor()

        moviesDetailView.moviesDetailPresenter = moviesDetailPresenter
        moviesDetailInteractor.moviesDetailPresenter = moviesDetailPresenter

        moviesDetailPresenter.moviesDetailRouter = router
        moviesDetailPresenter.moviesDetailView = moviesDetailView
        moviesDetailPresenter.moviesDetailInteractor = moviesDetailInteractor

        router.entry = moviesDetailView as? EntryPointMoviesDetail

        return router
    }
}
