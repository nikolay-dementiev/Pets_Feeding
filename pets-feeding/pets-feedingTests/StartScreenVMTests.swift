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
		// Put teardown code here. This method is called after the invocation of each test method in the class.~
		super.tearDown()
	}

	func testsGettingCalendarStatusInterlayer() {

		let tempParam = GetCalendarChekStatusInterlayer()

		var testStatus:EKAuthorizationStatus
		var expectedValue:StartScreenVM.calendarChekStatusInterlayer

		//1
		testStatus = EKAuthorizationStatus.authorized
		expectedValue = tempParam.accessGranted

		testsClassExample.gettingCalendarStatusInterlayer(testStatus, completion: { returnedValue in
			XCTAssertEqual(returnedValue, expectedValue, "gettingCalendarStatusInterlayer() ERROR!, tested status: \(testStatus), result expected: \(expectedValue), returned from func.: \(returnedValue)") })


		//2
		testStatus = EKAuthorizationStatus.denied
		expectedValue = tempParam.accessDenied

		testsClassExample.gettingCalendarStatusInterlayer(testStatus, completion: { returnedValue in
			XCTAssertEqual(returnedValue, expectedValue, "gettingCalendarStatusInterlayer() ERROR!, tested status: \(testStatus), result expected: \(expectedValue), returned from func.: \(returnedValue)") })

		//3
		testStatus = EKAuthorizationStatus.notDetermined
		if let statusER2 = chekRequestAccess() {

			if statusER2 == true {
				expectedValue = tempParam.accessGranted
			} else {
				expectedValue = tempParam.accessDenied
			}
			testsClassExample.gettingCalendarStatusInterlayer(testStatus, completion: { returnedValue in
				XCTAssertEqual(returnedValue, expectedValue, "gettingCalendarStatusInterlayer() ERROR!, tested status: \(testStatus), result expected: \(expectedValue), returned from func.: \(returnedValue)") })
		}
	}

		func testTestAccessToCalendar() {
	
			let tempParam = GetCalendarChekStatusInterlayer()
	
			//1
			XCTAssertNotNil(chekRequestAccess(), "RequestAccessStatus can't be 'nil' !")
	
			//2
			var testStatus = true
	
			let expectedValue2 = tempParam.accessGranted
			let returnedValue2 = testsClassExample.testAccessToCalendar(access: testStatus)
			XCTAssertEqual(returnedValue2, expectedValue2, "testAccessToCalendar() ERROR!, tested status: \(testStatus), result expected: \(expectedValue2), returned from func.: \(returnedValue2)")
	
			//2.1
			testStatus = false
	
			let expectedValue2_1 = tempParam.accessDenied
			let returnedValue2_1 = testsClassExample.testAccessToCalendar(access: testStatus)
			XCTAssertEqual(returnedValue2_1, expectedValue2_1, "testAccessToCalendar() ERROR!, tested status: \(testStatus), result expected: \(expectedValue2_1), returned from func.: \(returnedValue2_1)")
	
		}



	//	func testGettingCalendarStatusInterlayer() {
	//
	//		let tempParam = GetCalendarChekStatusInterlayer()//StartScreenVM.calendarChekStatusInterlayer.self
	//
	//		var testStatus:EKAuthorizationStatus
	//		var expectedValue:StartScreenVM.calendarChekStatusInterlayer
	//		var returnedValue:StartScreenVM.calendarChekStatusInterlayer
	//
	//		//1 accessGranted
	//		testStatus = EKAuthorizationStatus.authorized
	//		expectedValue = tempParam.accessGranted
	//		returnedValue = testsClassExample.gettingCalendarStatusInterlayer(testStatus)
	//		XCTAssertEqual(returnedValue, expectedValue, "gettingCalendarStatusInterlayer() ERROR!, tested status: \(testStatus), result expected: \(expectedValue), returned from func.: \(returnedValue)")
	//
	//		//2 accessDenied
	//		testStatus = EKAuthorizationStatus.denied
	//		expectedValue = tempParam.accessDenied
	//		returnedValue = testsClassExample.gettingCalendarStatusInterlayer(testStatus)
	//		XCTAssertEqual(returnedValue, expectedValue, "gettingCalendarStatusInterlayer() ERROR!, tested status: \(testStatus), result expected: \(expectedValue), returned from func.: \(returnedValue)")
	//
	//		//3 notDetermined - chek current status
	//		testStatus = EKAuthorizationStatus.notDetermined
	//
	//		if let statusER2 = chekRequestAccess() {
	//
	//			if statusER2 == true {
	//				expectedValue = tempParam.accessGranted
	//			} else {
	//				expectedValue = tempParam.accessDenied
	//			}
	//
	//			returnedValue = testsClassExample.gettingCalendarStatusInterlayer(testStatus)
	//
	//			XCTAssertEqual(returnedValue, expectedValue, "gettingCalendarStatusInterlayer() ERROR!, tested status: \(testStatus), result expected: \(expectedValue), returned from func.: \(returnedValue)")
	//
	//		}
	//	}
	//
	//	func testRequestAccessToCalendar() {
	//		let tempParam = GetCalendarChekStatusInterlayer()//StartScreenVM.calendarChekStatusInterlayer.self
	//
	//		//1
	//
	//		let statusRequestAccess:Bool = chekRequestAccess()!
	//		let expectedValue1 = testsClassExample.testAccessToCalendar(access: statusRequestAccess)
	//
	//		let returnedValue1 = testsClassExample.requestAccessToCalendar(tempParam.accessUncertain)
	//		XCTAssertEqual(returnedValue1, expectedValue1, "requestAccessToCalendar() ERROR!, tested access: \(statusRequestAccess), result expected: \(expectedValue1), returned from func.: \(returnedValue1)")
	//
	//	}
	//
	//	func testTestAccessToCalendar() {
	//
	//		let tempParam = GetCalendarChekStatusInterlayer()
	//
	//		//1
	//		XCTAssertNotNil(chekRequestAccess(), "RequestAccessStatus can't be 'nil' !")
	//
	//		//2
	//		var testStatus = true
	//
	//		let expectedValue2 = tempParam.accessGranted
	//		let returnedValue2 = testsClassExample.testAccessToCalendar(access: testStatus)
	//		XCTAssertEqual(returnedValue2, expectedValue2, "testAccessToCalendar() ERROR!, tested status: \(testStatus), result expected: \(expectedValue2), returned from func.: \(returnedValue2)")
	//
	//		//2.1
	//		testStatus = false
	//
	//		let expectedValue2_1 = tempParam.accessDenied
	//		let returnedValue2_1 = testsClassExample.testAccessToCalendar(access: testStatus)
	//		XCTAssertEqual(returnedValue2_1, expectedValue2_1, "testAccessToCalendar() ERROR!, tested status: \(testStatus), result expected: \(expectedValue2_1), returned from func.: \(returnedValue2_1)")
	//
	//	}
	//
	//	func testGettingStatusFromCalendar() {
	//
	//		let expectedEventValue = getExpectedEventValue()
	//		let returnedEventValue = testsClassExample.gettingStatusFromCalendar()
	//		XCTAssertEqual(returnedEventValue, expectedEventValue, "gettingStatusFromCalendar() ERROR! result expected: \(expectedEventValue), returned from func.: \(returnedEventValue)")
	//
	//	}
	//
	//	func testGetCalendarStatus() {
	//
	//		let expectedEventValue = getExpectedEventValue()
	//		let expectedValue = testsClassExample.gettingCalendarStatusInterlayer(expectedEventValue)
	//		let returnedValue = testsClassExample.getCalendarStatus()
	//		XCTAssertEqual(returnedValue, expectedValue, "getCalendarStatus() ERROR! expected: \(expectedValue), returned from func.: \(returnedValue)")
	//	}
	//
	//
	//
	//	//MARK: - func of class module
	//	private func getExpectedEventValue() -> EKAuthorizationStatus {
	//		return  EKEventStore.authorizationStatus(for: EKEntityType.event)
	//	}
	//
	private func GetCalendarChekStatusInterlayer() -> StartScreenVM.calendarChekStatusInterlayer.Type {

		let tempParam = StartScreenVM.calendarChekStatusInterlayer.self
		return tempParam
	}

	private func chekRequestAccess() -> Bool? {
		var value:Bool?

		let evStore = EKEventStore()
		evStore.reset()

		let expectation1 = expectation(description: "chekRequestAccess() runs the callback closure")

		evStore.requestAccess(to: EKEntityType.event, completion: {
			(accessGranted: Bool, error: Error?) in

			value = accessGranted

			expectation1.fulfill()
		})

		waitForExpectations(timeout: 5) { error in
			if let error = error {
				XCTFail("waitForExpectationsWithTimeout errored: \(error)")
			}
		}
		
		return value
	}
	
}
