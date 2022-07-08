//
//  InjectionRequestDataServiceProtocol.swift
//  Cinema
//
//  Created by Bruno Meneghin on 07/07/22.
//

/// A `protocol` so that we can present them into
/// `Interactor` classes for the injection requests from APIs
protocol InjectionRequestDataServiceProtocol {}

extension InjectionRequestDataServiceProtocol {
    var _requestData: RequestDataProtocol {
        RequestData()
    }
}
