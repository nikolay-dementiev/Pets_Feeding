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


	func getCalendarStatus() -> calendarChekStatusInterlayer {

		let status = gettingStatusFromCalendar()

		let valueForReturn = gettingCalendarStatusInterlayer(status)

		return valueForReturn
	}

	internal func gettingStatusFromCalendar() -> EKAuthorizationStatus{
		return EKEventStore.authorizationStatus(for: EKEntityType.event)
	}

	internal func gettingCalendarStatusInterlayer (_ status: EKAuthorizationStatus) -> calendarChekStatusInterlayer {
		var valueForReturn:calendarChekStatusInterlayer = .accessDeterminingError

		switch (status) {
		case EKAuthorizationStatus.notDetermined:
			// This happens on first-run

			valueForReturn = requestAccessToCalendar(.accessUncertain)
		case EKAuthorizationStatus.authorized:
			// Things are in line with being able to show the calendars in the table view
			valueForReturn = .accessGranted
		case EKAuthorizationStatus.restricted, EKAuthorizationStatus.denied:
			valueForReturn = .accessDenied
		}

		return valueForReturn
	}

	internal func requestAccessToCalendar(_ defValue: calendarChekStatusInterlayer) -> calendarChekStatusInterlayer {

		var value = defValue

		let evStore = EKEventStore()
		evStore.reset()
		evStore.requestAccess(to: EKEntityType.event, completion: {
			(accessGranted: Bool, error: Error?) in

			value = self.testAccessToCalendar(access: accessGranted)
		})

		return value
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
