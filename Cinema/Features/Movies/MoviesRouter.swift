//
//  MoviesRouter.swift
//  Cinema
//
//  Created by Bruno Meneghin on 10/08/21.
//

import UIKit

typealias EntryPointMovies = MoviesViewProtocol & UIViewController

protocol MoviesRouterProtocol {
    var entry: EntryPointMovies? { get }
    static func start() -> MoviesRouterProtocol
}

class MoviesRouter: MoviesRouterProtocol {
    var entry: EntryPointMovies?

    static func start() -> MoviesRouterProtocol {
        let router = MoviesRouter()

        var moviesView: MoviesViewProtocol = MoviesViewTableViewController()
        var moviesPresenter: MoviesPresenterProtocol = MoviesPresenter()
        var moviesInteractor: MoviesInteractorProtocol = MoviesInteractor()

        moviesView.moviesPresenter = moviesPresenter
        moviesInteractor.moviesPresenter = moviesPresenter

        moviesPresenter.moviesView = moviesView
        moviesPresenter.moviesInteractor = moviesInteractor
        moviesPresenter.moviesRouter = router

        router.entry = moviesView as? EntryPointMovies

        return router
    }
}
