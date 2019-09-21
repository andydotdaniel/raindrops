//
//  RaindropsTests.swift
//  RaindropsTests
//
//  Created by Andrew Daniel on 9/21/19.
//  Copyright © 2019 Andrew Daniel. All rights reserved.
//

import XCTest
@testable import Raindrops

class RaindropsTests: XCTestCase {

    var viewController: ViewController!
    
    override func setUp() {
        viewController = ViewController(nibName: nil, bundle: nil)
        viewController.viewDidLoad()
    }

    override func tearDown() {
        viewController = nil
    }

    func testSetup() {
        guard let gestureRecognizer = viewController.tapView.gestureRecognizers?.first else {
            XCTFail("No tap gesture recognizer set on tap view.")
            return
        }
        XCTAssertNotNil(gestureRecognizer is UITapGestureRecognizer, "Main view should have gesture recognizer on tap view")
        
        XCTAssertNotNil(viewController.instructionsLabel)
        XCTAssertEqual(viewController.instructionsLabel?.text, "Tap on the screen to start the raindrops.")
    }

}
