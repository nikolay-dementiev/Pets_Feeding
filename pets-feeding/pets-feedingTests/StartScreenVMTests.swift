//
//  StartScreenVCTests.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 10.10.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import XCTest
import EventKit
@testable import pets_feeding

class StartScreenVMTests: XCTestCase {

	var testsClassExample: StartScreenVM!

	override func setUp() {
		super.setUp()
		// Put setup code here. This method is called before the invocation of each test method in the class.
		testsClassExample = StartScreenVM()
	}

	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
	}

	func testGettingCalendarStatusInterlayer() {

		let tempParam = StartScreenVM.calendarChekStatusInterlayer.self

		var testStatus:EKAuthorizationStatus
		var expectedValue:StartScreenVM.calendarChekStatusInterlayer
		var returnedValue:StartScreenVM.calendarChekStatusInterlayer

		//1
		testStatus = EKAuthorizationStatus.authorized
		expectedValue = tempParam.accessGranted
		returnedValue = testsClassExample.gettingCalendarStatusInterlayer(testStatus)
		XCTAssertEqual(returnedValue, expectedValue, "gettingCalendarStatusInterlayer() ERROR!, tested status: \(testStatus), result expected: \(expectedValue), returned from func.: \(returnedValue)")

		//2
		testStatus = EKAuthorizationStatus.denied
		expectedValue = tempParam.accessDenied
		returnedValue = testsClassExample.gettingCalendarStatusInterlayer(testStatus)
		XCTAssertEqual(returnedValue, expectedValue, "gettingCalendarStatusInterlayer() ERROR!, tested status: \(testStatus), result expected: \(expectedValue), returned from func.: \(returnedValue)")

	}

	func testGettingStatusFromCalendar() {

		let expectedEventValue = getExpectedEventValue()
		let returnedEventValue = testsClassExample.gettingStatusFromCalendar()
		XCTAssertEqual(returnedEventValue, expectedEventValue, "gettingStatusFromCalendar() ERROR! result expected: \(expectedEventValue), returned from func.: \(returnedEventValue)")

	}

	func testGetCalendarStatus() {

		let expectedEventValue = getExpectedEventValue()
		let expectedValue = testsClassExample.gettingCalendarStatusInterlayer(expectedEventValue)
		let returnedValue = testsClassExample.getCalendarStatus()
		XCTAssertEqual(returnedValue, expectedValue, "getCalendarStatus() ERROR! expected: \(expectedValue), returned from func.: \(returnedValue)")
	}

	//MARK: - func of class module
	private func getExpectedEventValue() -> EKAuthorizationStatus {
		return  EKEventStore.authorizationStatus(for: EKEntityType.event)
	}
	
}
