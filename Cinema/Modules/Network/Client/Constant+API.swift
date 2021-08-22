//
//  Constant+API.swift
//  Cinema
//
//  Created by Bruno Meneghin on 11/08/21.
//

import Foundation

enum API {
    dynamic fileprivate static let key = ""

    enum URL {
        static let base = "https://api.themoviedb.org/3/movie/"
        static let basePoster = "https://image.tmdb.org/t/p/w500/"
    }

    enum Path {
        static let nowPlaying = "now_playing?api_key=" + key
    }

    enum Region {
        static let country = Locale.current.languageCode == "en"
                           ? "&language=us-US&page=1&region=US"
                           : "&language=pt-BR&page=1&region=BR"
    }
}
