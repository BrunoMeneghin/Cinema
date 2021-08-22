//
//  DecorateMoviesTableViewCellLayout.swift
//  Cinema
//
//  Created by Bruno Meneghin on 19/08/21.
//

import UIKit

final class DecorateMoviesTableViewCellLayout: UITableViewCell, DrawableMoviesTableViewCellLayoutProtocol {
    lazy var titleMovieLabel = CustomLabel()
    lazy var moviePosterImage = CustomImageView()

    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let metrics: CGFloat = 20.0
        contentView.addSubview(moviePosterImage)
        contentView.addSubview(titleMovieLabel)

        NSLayoutConstraint.activate([
            moviePosterImage.widthAnchor.constraint(equalToConstant: 50.0),
            moviePosterImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: metrics/3),
            moviePosterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: metrics),
            moviePosterImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -metrics/3),

            titleMovieLabel.centerYAnchor.constraint(equalTo: moviePosterImage.centerYAnchor),
            titleMovieLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -metrics),
            titleMovieLabel.leadingAnchor.constraint(equalTo: moviePosterImage.trailingAnchor, constant: metrics)
        ])

        titleMovieLabel.sizeToFit()
        titleMovieLabel.textAlignment = .left

        moviePosterImage.sizeToFit()
        moviePosterImage.contentMode = .scaleToFill
        moviePosterImage.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
