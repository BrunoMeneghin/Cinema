//
//  Constant+API.swift
//  Cinema
//
//  Created by Bruno Meneghin on 11/08/21.
//

import Foundation

enum API {
    static let basePoster = "https://image.tmdb.org/t/p/w500/"
    
    private static let base = "https://api.themoviedb.org/3/movie/"
    
    private static let country = Locale.current.languageCode == "en"
                               ? "&language=us-US&page=1&region=US"
                               : "&language=pt-BR&page=1&region=BR"
    
    enum MoviePath {
        case nowPlaying
    }
        
    case moviePath(MoviePath)
    
    var domain: String {
        let path: String
        let _baseURL = Self.base
        let _region = Self.country
        
        switch self {
        case .moviePath(.nowPlaying): path = _baseURL + "now_playing?api_key=" + _region // API Key: https://www.themoviedb.org
        }
        
        return path
    }
}
