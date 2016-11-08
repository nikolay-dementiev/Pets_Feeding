//
//  GeneralPurpose.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 07.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation

struct GeneralPurpose {
	static var shared = GeneralPurpose()

	let nameOfCoreDataModel = "PetsFeeding"
	var dataStorage = StorageManager.shared;

}
