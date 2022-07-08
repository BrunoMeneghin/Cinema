//
//  MoviesProtocols.swift
//  Cinema
//
//  Created by Bruno Meneghin on 07/07/22.
//

import UIKit

protocol MoviesAttributesDetailProtocol: AnyObject {
    var posterMovie: String { get set }
    var originalTitleMovie: String { get set }
}

protocol MoviesViewProtocol {
    var moviesPresenter: MoviesPresenterProtocol? { get set }
    
    func updateMoviesWithErrorHandling(_ error: HTTPClient)
    func updateMovies(with movies: [Movie])
}

protocol MoviesInteractorProtocol: InjectionRequestDataServiceProtocol {
    var moviesPresenter: MoviesPresenterProtocol? { get set }
  
    func getMovies()
}

protocol MoviesPresenterProtocol {
    var moviesView: MoviesViewProtocol? { get set }
    var moviesRouter: MoviesRouterProtocol? { get set }
    var moviesInteractor: MoviesInteractorProtocol? { get set }

    func fetchMoviesInteractor(_ result: Result<[Movie]?, HTTPClient>)
    
    func destinationRouteForMovieDetails<MoviePoster: UINavigationController>(movieRoom: MoviePoster,
                                                                              movieTitle: [Movie], movieTicket: Int?)
}

protocol MoviesRouterProtocol {
    var entry: EntryPointMovies? { get }
    
    static func start() -> MoviesRouterProtocol
}

