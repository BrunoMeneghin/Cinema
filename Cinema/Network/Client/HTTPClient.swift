//
//  HTTPClient.swift
//  Cinema
//
//  Created by Bruno Meneghin on 11/08/21.
//

import Foundation

enum HTTPClient: Error {
    case success
    case clientError
    case serverError

    var identifier: String {
        let error: String
        switch self {
        case .success: error = "Success"
        case .clientError: error = "Client Error"
        case .serverError: error = "Internal Server Error"
        }
        return error
    }
}

