//
//  RequestDataProtocol.swift
//  Cinema
//
//  Created by Bruno Meneghin on 26/08/21.
//

import Foundation

protocol RequestDataProtocol {
    func serviceRequest<E: Decodable>(with url: API,
                                   completion: @escaping (Result<E?, HTTPClient>) -> Void)
}
