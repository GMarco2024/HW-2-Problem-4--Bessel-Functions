//
//  HW_2_Problem_4__Bessel_FunctionsUITestsLaunchTests.swift
//  HW 2 Problem 4- Bessel FunctionsUITests
//
//  Created by Marco on 2/13/24.
//

import XCTest

final class HW_2_Problem_4__Bessel_FunctionsUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
