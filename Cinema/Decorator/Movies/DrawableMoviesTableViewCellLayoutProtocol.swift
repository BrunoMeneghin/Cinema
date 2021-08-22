//
//  DrawableMoviesTableViewCellLayoutProtocol.swift
//  Cinema
//
//  Created by Bruno Meneghin on 19/08/21.
//

import UIKit

protocol DrawableMoviesTableViewCellLayoutProtocol {
    var titleMovieLabel: CustomLabel { mutating get set }
    var moviePosterImage: CustomImageView { mutating get set }

    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
}
