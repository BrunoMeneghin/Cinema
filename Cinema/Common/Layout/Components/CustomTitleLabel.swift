//
//  CustomTitleLabel.swift
//  Cinema
//
//  Created by Bruno Meneghin on 19/08/21.
//

import UIKit

class CustomLabel: UILabel {
    init() {
        super.init(frame: .zero)
        textAlignment = .center
        isAccessibilityElement = true
        adjustsFontSizeToFitWidth = true
        accessibilityIdentifier = "movie_title_label"
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont(name: "ChalkboardSE-Bold", size: 21.0)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
