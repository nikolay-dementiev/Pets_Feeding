//
//  StartPoint.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 12.10.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import UIKit

struct StartPoint {

	static func StartTheProgram(_ window: UIWindow?) {

		if let appWindow = window {
			let storyboard = UIStoryboard(name: "Main", bundle: nil)
			let initialViewController = storyboard.instantiateViewController(withIdentifier: "StartScreenVC") as! StartScreenVC
			initialViewController.viewModel = StartScreenVM()

			appWindow.rootViewController = initialViewController
			appWindow.makeKeyAndVisible()

		} else {
			print("can`t detect initial view controller!")
		}
	}

}
