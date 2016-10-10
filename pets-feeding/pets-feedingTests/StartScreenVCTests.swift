//
//  StartScreenVCTests.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 10.10.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import XCTest

class StartScreenVCTests: XCTestCase {

	//var TestsClassExample: StartScreenVC!

	override func setUp() {
		super.setUp()
		// Put setup code here. This method is called before the invocation of each test method in the class.
		//TestsClassExample = StartScreenVC()
	}

	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
	}

	func testViewWillAppear() {
				// This is an example of a functional test case.
		// Use XCTAssert and related functions to verify your tests produce the correct results.

		testCheckCalendarAuthorizationStatus()

		let expectedValue = 0
//		XCTAssertEqual(TestsClassExample.needPermissionView.alpha, expectedValue, "needPermissionView.alpha should be \(expectedValue)")
	}

	func testCheckCalendarAuthorizationStatus() {

	}

	func testPerformanceExample() {
		// This is an example of a performance test case.
		self.measure {
			// Put the code you want to measure the time of here.
		}
	}

}
