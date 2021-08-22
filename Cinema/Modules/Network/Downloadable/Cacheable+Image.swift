//
//  Cacheable+Image.swift
//  Cinema
//
//  Created by Bruno Meneghin on 19/08/21.
//

import UIKit

struct CacheableImage {
    // MARK: Properties

    static let shared = CacheableImage()
    fileprivate let cache: NSCache<NSString, UIImage>

    // MARK: Private Initialization

    fileprivate init() {
        cache = NSCache<NSString, UIImage>()
    }

    // MARK: Cache & Function

    func cacheableImageFromURL(from url: URL, completion: @escaping ((UIImage?) -> Void)) {
        if let _imageCached = cache.object(forKey: url.absoluteString as NSString) {
            DispatchQueue.main.async {
                completion(_imageCached)
            }
        } else {
            URLSession.shared.dataTask(with: url) { [cache] (data, response, error) in
                guard error == nil,
                      let data = data,
                      let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                      let _image = UIImage(data: data) else {

                    return
                }

                cache.setObject(_image, forKey: url.absoluteString as NSString)
                DispatchQueue.main.async {
                    completion(_image)
                }
            }.resume()
        }
    }
}
