//
//  CustomImageView.swift
//  Cinema
//
//  Created by Bruno Meneghin on 19/08/21.
//

import UIKit

class CustomImageView: UIImageView {
    init() {
        super.init(frame: .zero)
        clipsToBounds = true
        backgroundColor = .clear
        layer.cornerRadius = 4.4
        contentMode = .scaleAspectFit
        isAccessibilityElement = true
        layer.cornerCurve = .continuous
        accessibilityIdentifier = "custom_image_view"
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
