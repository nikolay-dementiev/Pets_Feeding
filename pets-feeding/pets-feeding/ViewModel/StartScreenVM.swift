//
//  StartScreenVM.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 10.10.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import EventKit

struct StartScreenVM {

	enum calendarChekStatusInterlayer {
		case accessGranted // accessGranted, authorized
		case accessUncertain // notDetermined, (maby it's first run)
		case accessDenied // restricted, denied
		case accessDeterminingError // error
	}


	func getCalendarStatus(completion: @escaping CompletionHandler) {

		let status = gettingStatusFromCalendar()

		gettingCalendarStatusInterlayer(status, completion: {value in
			completion(value)
		})
	}

	internal func gettingStatusFromCalendar() -> EKAuthorizationStatus {
		return EKEventStore.authorizationStatus(for: EKEntityType.event)
	}

	internal func gettingCalendarStatusInterlayer (_ status: EKAuthorizationStatus, completion: @escaping CompletionHandler) {

		switch (status) {
		case EKAuthorizationStatus.notDetermined:
			// This happens on first-run

			requestAccessToCalendar(.accessUncertain, completion: {value in
				completion(value)
			})

		case EKAuthorizationStatus.authorized:
			// Things are in line with being able to show the calendars in the table view
			completion(.accessGranted)
		case EKAuthorizationStatus.restricted, EKAuthorizationStatus.denied:
			completion(.accessDenied)
		}
	}

	typealias CompletionHandler = (_ status: calendarChekStatusInterlayer) -> Void

	internal func requestAccessToCalendar(_ defValue: calendarChekStatusInterlayer, completion: @escaping CompletionHandler) {

		let evStore = EKEventStore()
		evStore.reset()

			evStore.requestAccess(to: EKEntityType.event, completion: {
				(accessGranted: Bool, error: Error?) in

				let value = self.testAccessToCalendar(access: accessGranted)

				completion(value)
			})
	}

	internal func testAccessToCalendar(access: Bool) -> calendarChekStatusInterlayer {

		var value: calendarChekStatusInterlayer

		if access == true {
			value = calendarChekStatusInterlayer.accessGranted
		} else {
			value = calendarChekStatusInterlayer.accessDenied
		}
		
		return value
	}
	
}
