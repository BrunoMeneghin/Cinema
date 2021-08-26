//
//  CustomSmallButton.swift
//  Cinema
//
//  Created by Bruno Meneghin on 19/08/21.
//

import UIKit

class CustomSmallButton: UIButton {
    fileprivate lazy var customColor = UIColor()

    init(custom image: UIImage, tint color: UIColor) {
        super.init(frame: .zero)
        customColor = color
        backgroundColor = .clear
        imageView?.tintColor = color
        isAccessibilityElement = true
        setImage(image, for: .normal)
        contentVerticalAlignment = .fill
        contentHorizontalAlignment = .fill
        accessibilityIdentifier = "small_button"
        imageView?.contentMode = .scaleAspectFit
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var isHighlighted: Bool {
        didSet {
            imageView?.tintColor = !isHighlighted ? customColor : .cyan
        }
    }
}
