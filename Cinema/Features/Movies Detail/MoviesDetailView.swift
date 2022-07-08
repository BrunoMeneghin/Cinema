//
//  MoviesDetailView.swift
//  Cinema
//
//  Created by Bruno Meneghin on 12/08/21.
//

import UIKit

class MoviesDetailViewController: UIViewController, MoviesDetailViewProtocol {
    // MARK: Properties

    var moviesDetailPresenter: MoviesDetailPresenterProtocol?
    dynamic lazy var decorateMoviesDetail = DecorateMoviesDetailLayout()
    weak var movieAttributeDetailDelegate: MoviesAttributesDetailProtocol?

    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        engineeringUI()
    }

    func updateMoviesDetail() {
        DispatchQueue.main.async { [unowned self] in
            if let titleMovie = movieAttributeDetailDelegate?.originalTitleMovie,
               let moviePoster = movieAttributeDetailDelegate?.posterMovie {
                self.decorateMoviesDetail.titleMovieLabel.text = titleMovie
                self.decorateMoviesDetail.posterMovieImageView.downloadableImage(with: moviePoster)
            }
        }
    }

    private func engineeringUI() {
        let gradientColor = CAGradientLayer()
        gradientColor.frame = view.frame
        gradientColor.colors = [UIColor.systemGreen.cgColor, UIColor.black.cgColor]
        view.backgroundColor = .clear
        view.layer.insertSublayer(gradientColor, at: 0)
        decorateMoviesDetail.draw(view)
        decorateMoviesDetail.customCloseButton
            .addTarget(self, action: #selector(didTapSmallCloseButton(_:)), for: .touchUpInside)
    }

    @objc
    private func didTapSmallCloseButton(_ button: UIButton) {
        dismiss(animated: true)
    }
}
