//
//  RequestData.swift
//  Cinema
//
//  Created by Bruno Meneghin on 26/08/21.
//

import Foundation

final class RequestData: RequestDataProtocol {
    func serviceRequest<E>(with url: API,
                        completion: @escaping (Result<E?, HTTPClient>) -> Void) where E : Decodable {
        guard let _url = URL(string: url.domain) else { return }
        URLSession.shared.dataTask(with:_url) { data, response, error in
            guard error == nil,
                  let data = data,
                  let response = response
            else { return }

            guard let httpURLResponse = response as? HTTPURLResponse else { return }
            let entity = try? JSONDecoder().decode(E?.self, from: data)

            switch httpURLResponse.statusCode {
            case 200...299: completion(.success(entity))
            case 400...499: completion(.failure(.clientError))
            case 500...599: completion(.failure(.serverError))
            default: break
            }
        }.resume()
    }
}
