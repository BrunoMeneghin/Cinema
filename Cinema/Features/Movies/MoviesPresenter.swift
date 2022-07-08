//
//  MoviesPresenter.swift
//  Cinema
//
//  Created by Bruno Meneghin on 10/08/21.
//

import UIKit

final class MoviesPresenter: MoviesPresenterProtocol, MoviesAttributesDetailProtocol {
    // MARK: Properties
    
    lazy var posterMovie = String()
    lazy var originalTitleMovie = String()
    
    var moviesView: MoviesViewProtocol?
    var moviesRouter: MoviesRouterProtocol?
    var moviesInteractor: MoviesInteractorProtocol? {
        // --> Input
        
        didSet {
            moviesInteractor?.getMovies()
        }
    }

    // MARK: Functions
    
    // <-- Output
    
    func fetchMoviesInteractor(_ result: Result<[Movie]?, HTTPClient>) {
        switch result {
        case .success(let movies):
            guard let movie = movies else { break }
            moviesView?.updateMovies(with: movie)
        
        case .failure(let err):
            moviesView?.updateMoviesWithErrorHandling(err)
        }
    }
    
    // <-- Destination Segue -->
    
    func destinationRouteForMovieDetails<MoviePoster>(movieRoom: MoviePoster,
                                                      movieTitle: [Movie], movieTicket: Int?) where MoviePoster : UINavigationController {
        let movie = movieTitle[movieTicket ?? 0]
        let moviesDetailRouter = MoviesDetailRouter.start()

        if var presentableMoviesDetailViewController = moviesDetailRouter.entry {
            presentableMoviesDetailViewController.movieAttributeDetailDelegate = self
            posterMovie = movie.poster
            originalTitleMovie = movie.originalTitle

            movieRoom.present(presentableMoviesDetailViewController, animated: true)
        }
    }
}
