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

	@IBOutlet weak var needPermissionView: UIView!

	@IBAction func goToSettingsButtonTapped(sender: UIButton) {
		openSettingsScreenOnDevice()
	}

	//MARK: Native Controller's func.

	internal override func viewDidLoad() {
		super.viewDidLoad()
	}

	internal override func viewWillAppear(_ animated: Bool) {
		checkCalendarAuthorizationStatus()
		//
		needPermissionView.alpha = 0
		navigationController?.setNavigationBarHidden(true, animated: false)
	}

	internal override func viewWillDisappear(_ animated: Bool) {
		navigationController?.setNavigationBarHidden(false, animated: true)
	}

	internal override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// MARK: - BL-function
	//BL = Business Logic

	private func openSettingsScreenOnDevice() {
		let openSettingsUrl = NSURL(string: UIApplicationOpenSettingsURLString)
		UIApplication.shared.openURL(openSettingsUrl! as URL)
	}


	private func checkCalendarAuthorizationStatus() {
		let status = EKEventStore.authorizationStatus(for: EKEntityType.event)

		switch (status) {
		case EKAuthorizationStatus.notDetermined:
			// This happens on first-run
			requestAccessToCalendar()
		case EKAuthorizationStatus.authorized:
			// Things are in line with being able to show the calendars in the table view
			self.gotoMainProgrammScreen()
			//print (status)

		case EKAuthorizationStatus.restricted, EKAuthorizationStatus.denied:
			// We need to help them give us permission
			DispatchQueue.main.async(execute: {
				self.needPermissionView.fadeIn()
			})
			//print (status)
		}
	}

	private func requestAccessToCalendar() {
		let evStore = EKEventStore()
		evStore.reset()
		evStore.requestAccess(to: EKEntityType.event, completion: {
			(accessGranted: Bool, error: Error?) in

			if accessGranted == true {
				DispatchQueue.main.async(execute: {
					self.gotoMainProgrammScreen()
				})
			} else {
				DispatchQueue.main.async(execute: {
					self.needPermissionView.fadeIn()
				})
			}
		})
	}

	private func gotoMainProgrammScreen() {
		self.performSegue(withIdentifier: "goToMainScreen", sender: nil)
	}

	// MARK: - Navigation

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "goToMainScreen" {
			let newVC = segue.destination
			newVC.navigationItem.setHidesBackButton(true, animated:false)
		}
	}
	
}
