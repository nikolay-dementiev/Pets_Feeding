//
//  StartScreenVC.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 05.10.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import UIKit
import EventKit

class StartScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	override func viewWillAppear(_ animated: Bool) {
		checkCalendarAuthorizationStatus()
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	func checkCalendarAuthorizationStatus() {
		let status = EKEventStore.authorizationStatus(for: EKEntityType.event)

		switch (status) {
		case EKAuthorizationStatus.notDetermined:
			// This happens on first-run
			requestAccessToCalendar()
		case EKAuthorizationStatus.authorized:
			// Things are in line with being able to show the calendars in the table view
//			loadCalendars()
//			refreshTableView()
			print ("authorized")

		case EKAuthorizationStatus.restricted, EKAuthorizationStatus.denied:
			// We need to help them give us permission
			//needPermissionView.fadeIn()
			print ("restricted or denied")
		}
	}

	func requestAccessToCalendar() {
		let evStore = EKEventStore()
		evStore.reset()
		evStore.requestAccess(to: EKEntityType.event, completion: {
			(accessGranted: Bool, error: Error?) in

			if accessGranted == true {
				DispatchQueue.main.async(execute: {
//					self.loadCalendars()
//					self.refreshTableView()

					//performSegue(withIdentifier: "goToMainScreen", sender: nil)


				})
			} else {
				DispatchQueue.main.async(execute: {
					//self.needPermissionView.fadeIn()
				})
			}
		})
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
