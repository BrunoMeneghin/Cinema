//
//  CinemaUITests.swift
//  CinemaUITests
//
//  Created by Bruno Meneghin on 10/08/21.
//

import XCTest

class CinemaUITests: XCTestCase {
    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["The Suicide Squad"]/*[[".cells.staticTexts[\"The Suicide Squad\"]",".staticTexts[\"The Suicide Squad\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
