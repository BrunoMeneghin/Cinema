//
//  CinemaTests.swift
//  CinemaTests
//
//  Created by Bruno Meneghin on 10/08/21.
//

import XCTest
@testable import Cinema

class CinemaTests: XCTestCase {
    
    func testClassIfAPIServiceProtocolServiceWasInjected() throws {
        class SomeInteractorClass: InjectionRequestDataServiceProtocol {}
        XCTAssertTrue(SomeInteractorClass()._requestData is RequestData)
    }
}
