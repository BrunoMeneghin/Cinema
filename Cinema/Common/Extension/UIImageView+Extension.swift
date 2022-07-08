//
//  UIImageView+Extension.swift
//  Cinema
//
//  Created by Bruno Meneghin on 19/08/21.
//

import UIKit

extension UIImageView {
    func downloadableImage(with url: String) {
        clipsToBounds = true
        tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        image = UIImage(systemName: "text.below.photo.fill")

        let path = API.basePoster + url
        guard let urlPath = URL(string: path) else { return }

        CacheableImage.shared.cacheableImageFromURL(from: urlPath) { [weak self] (image) in
            guard let _image = image else { return }
            self?.alpha = 0.0
            self?.image = _image

            UIView.animate(withDuration: 0.55) {
                self?.contentMode = .redraw
                self?.alpha = 1.0
            }
        }
    }
}
