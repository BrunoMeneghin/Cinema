//
//  MoviesEntity.swift
//  Cinema
//
//  Created by Bruno Meneghin on 10/08/21.
//

import Foundation

struct MovieCatalog: Decodable {
    var results: [Movie]
}

struct Movie: Decodable {
    var poster: String
    var synopsis: String
    var originalTitle: String

    private enum CodingKeys: String, CodingKey {
        case synopsis = "overview"
        case poster = "poster_path"
        case originalTitle = "original_title"
    }
}
