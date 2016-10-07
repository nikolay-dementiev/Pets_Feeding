//  StartScreenVC.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 07.10.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
	func fadeIn(duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
		UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
			self.alpha = 1.0
			}, completion: completion)  }
	
	func fadeOut(duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
		UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
			self.alpha = 0.0
			}, completion: completion)
	}
}
