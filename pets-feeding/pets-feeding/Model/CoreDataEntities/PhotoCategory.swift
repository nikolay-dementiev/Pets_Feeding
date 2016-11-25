//
//  categoryPhoto.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 25.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation

//cPhoto
enum PhotoCategory: Int16 {
    case sad = 1
    case normal = 2
    case happy = 3
    case none = 0

    func unwrap() -> Int {

        return Int(self.rawValue)
    }
}
