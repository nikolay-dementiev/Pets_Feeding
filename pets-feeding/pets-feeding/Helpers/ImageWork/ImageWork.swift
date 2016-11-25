//
//  ImageWork.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 25.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import UIKit

class ImageWork {

    //http://stackoverflow.com/questions/27995955/saving-picked-image-to-coredata

    static let testImageDictionary: [PhotoCategory : NSData] =
        [.sad: getImageForMOCObject(loadTestImageFromApp("Picture1-sad")),
         .normal: getImageForMOCObject(loadTestImageFromApp("Picture2-normal")),
         .happy: getImageForMOCObject(loadTestImageFromApp("Picture3-happy"))];

    static private func loadTestImageFromApp(_ name: String) -> UIImage {
        let imageFromApp = UIImage(named: name)

        return imageFromApp!
    }

    static func getImageForMOCObject(_ image: UIImage) -> NSData {

        let imageData:NSData = NSData(data: UIImageJPEGRepresentation(image, 1.0)!)

        return imageData
    }

}
