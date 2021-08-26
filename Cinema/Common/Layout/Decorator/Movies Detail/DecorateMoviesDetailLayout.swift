//
//  DecorateMoviesDetailLayout.swift
//  Cinema
//
//  Created by Bruno Meneghin on 19/08/21.
//

import UIKit

struct DecorateMoviesDetailLayout: DrawableMoviesDetailLayoutProtocol {
    lazy var titleMovieLabel = CustomLabel()
    lazy var posterMovieImageView = CustomImageView()
    lazy var customCloseButton: CustomSmallButton = {
        return .init(custom: UIImage(systemName: "xmark.circle.fill") ?? UIImage(),
                     tint: #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 0.8544857202))
    }()
}

extension DrawableMoviesDetailLayoutProtocol where Self == DecorateMoviesDetailLayout {
    mutating func draw<Layout>(_ view: Layout) where Layout : UIView {
        let metrics: CGFloat = 20.0
        view.addSubview(titleMovieLabel)
        view.addSubview(customCloseButton)
        view.addSubview(posterMovieImageView)

        NSLayoutConstraint.activate([
            customCloseButton.widthAnchor.constraint(equalToConstant: 30.0),
            customCloseButton.heightAnchor.constraint(equalToConstant: 30.0),
            customCloseButton.topAnchor.constraint(equalTo: view.topAnchor, constant: metrics),
            customCloseButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -metrics),

            titleMovieLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleMovieLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: metrics),
            titleMovieLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -metrics),
            titleMovieLabel.topAnchor.constraint(equalTo: customCloseButton.bottomAnchor, constant: metrics),

            posterMovieImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100.0),
            posterMovieImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: metrics),
            posterMovieImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -metrics),
            posterMovieImageView.topAnchor.constraint(equalTo: titleMovieLabel.bottomAnchor, constant: metrics),
        ])

        titleMovieLabel.sizeToFit()

        posterMovieImageView.sizeToFit()
        posterMovieImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
