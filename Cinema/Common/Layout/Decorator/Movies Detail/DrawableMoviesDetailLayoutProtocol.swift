//
//  DrawableMoviesDetailLayoutProtocol.swift
//  Cinema
//
//  Created by Bruno Meneghin on 19/08/21.
//

import UIKit

protocol DrawableMoviesDetailLayoutProtocol {
    var titleMovieLabel: CustomLabel { mutating get set }
    var customCloseButton: CustomSmallButton { mutating get set }
    var posterMovieImageView: CustomImageView { mutating get set }

    mutating func draw<Layout: UIView>(_ view: Layout)
}
