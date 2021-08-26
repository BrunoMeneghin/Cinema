//
//  MoviesView.swift
//  Cinema
//
//  Created by Bruno Meneghin on 10/08/21.
//

import UIKit

fileprivate let reusableIdentifier: String = "moviesCellID"

protocol MoviesViewProtocol {
    var moviesPresenter: MoviesPresenterProtocol? { get set }
    
    func updateMoviesWithErrorHandling(_ error: HTTPClient)
    func updateMovies(with movies: [Movie])
}

class MoviesViewTableViewController: UITableViewController, MoviesViewProtocol, MoviesAttributesDetailProtocol {
    // MARK: Properties

    lazy var originalTitleMovie = String()
    lazy var posterMovie = String()

    var moviesPresenter: MoviesPresenterProtocol?
    dynamic private lazy var movies: [Movie] = []

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        engineeringUI()
    }

    // MARK: Functions

    private func engineeringUI() {
        navigationItem.title = "Cinema"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(DecorateMoviesTableViewCellLayout.self,
                           forCellReuseIdentifier: reusableIdentifier)
    }

    func updateMovies(with movies: [Movie]) {
        DispatchQueue.main.async { [unowned self] in
            self.movies = movies
            self.tableView.reloadData()
        }
    }

    func updateMoviesWithErrorHandling(_ error: HTTPClient) {
        debugPrint(error.identifier)
    }
    
    // MARK: Data Source
    
    override func numberOfSections(in tableView: UITableView) -> Int { 1 }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count > 0 ? movies.count : 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reusableIdentifier, for: indexPath) as? DecorateMoviesTableViewCellLayout
        else { return UITableViewCell() }
        let movie = movies[indexPath.row]
        cell.selectionStyle = .none
        cell.moviePosterImage.downloadableImage(with: movie.poster)
        cell.titleMovieLabel.text = movie.originalTitle

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        let moviesDetailRouter = MoviesDetailRouter.start()

        if var presentableMoviesDetailViewController = moviesDetailRouter.entry {
            presentableMoviesDetailViewController.movieAttributeDetailDelegate = self
            posterMovie = movie.poster
            originalTitleMovie = movie.originalTitle

            present(presentableMoviesDetailViewController, animated: true)
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 75.0 }
}
