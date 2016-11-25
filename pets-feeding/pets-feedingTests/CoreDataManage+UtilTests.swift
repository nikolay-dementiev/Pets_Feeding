//
//  CoreDataTests.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 07.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import XCTest
@testable import pets_feeding

class CoreDataTests: XCTestCase {

    private let ourEntityName = GeneralPurpose.nameOfCoreDataModelPF
    private var dataStorageForTest: StorageManager?

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        dataStorageForTest = StorageManager.getSharedStorageManager(ourEntityName)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        dataStorageForTest = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    //MARK: - testCoreData
    //MARK: UsedInAppPets
    func testCoreData_UsedInAppPets() {

        let initCount = UsedInAppPets.countOfItemInEntity
        var currentCount = initCount

        let nameOfCoreDataEntity = UsedInAppPets.nameOfCoreDataEntity
        //        StorageManager.deleteAllData(entityName: nameOfCoreDataEntity)
        //        XCTAssertFalse((UsedInAppPets.countOfItemInEntity)! > 0)

        //* StorageManager - prepare data
        var dataForObj = UsedInAppPets.fields
        dataForObj["activ"]  = FieldType(false)
//        dataForObj["createTime"] = FieldType(NSDate.getCurrentDate())
        dataForObj["name"] =  FieldType("Dog Sharik")
//        dataForObj["updateTime"] = FieldType(NSDate.getCurrentDate())
        dataForObj["petDetails"] = FieldType()
        dataForObj["petsRemAppStack"] = FieldType()

        _ = UsedInAppPets.insertNewInstance(storage: dataStorageForTest,
                                                        data: dataForObj,
                                                        saveData: true)
        currentCount += 1

        dataForObj.updateValue(FieldType("Dog Tuzik"), forKey: "name")
        let petObject2 = UsedInAppPets.insertNewInstance(storage: dataStorageForTest,
                                                         data: dataForObj,
                                                         saveData: true)
        currentCount += 1

        //chek count
        XCTAssertEqual(UsedInAppPets.countOfItemInEntity, currentCount)

        //deleting  data
        //* StorageManager.deleteObject
        let petObject2Name = (petObject2 as! UsedInAppPets).name
        StorageManager.deleteObject(entityName: ourEntityName, object: petObject2!)

        currentCount -= 1
        XCTAssertEqual(UsedInAppPets.countOfItemInEntity, currentCount)

        //try to find this item
        let predicate2 = NSPredicate(format: "name == %@", petObject2Name!)
        let allItems2 = UsedInAppPets.getItems(predicate: predicate2)
        XCTAssertFalse(allItems2?.count != 0)


        //* StorageManager.saveAllContext
        let mov = StorageManager.getManagedObjectContext(ourEntityName)
         dataForObj.updateValue(FieldType("Dog Suzja2"), forKey: "name")
        _ = UsedInAppPets.insertNewInstance(storage: dataStorageForTest,
                                            data: dataForObj,
                                            saveData: false)

        StorageManager.saveContext(mo: mov)
        currentCount += 1
        XCTAssertEqual(UsedInAppPets.countOfItemInEntity, currentCount)

        StorageManager.saveAllContext()

        let predicateSearchValue = dataForObj["name"]?.unwrapWithCasting()
        let predicate4 = NSPredicate(format: "name == %@", predicateSearchValue!)
        let allItems4 = UsedInAppPets.getItems(predicate: predicate4)
        XCTAssertFalse(allItems4?.count == 0)

        //* StorageManager.deleteAllData
        StorageManager.deleteAllData(entityName: nameOfCoreDataEntity)
        XCTAssertFalse(UsedInAppPets.countOfItemInEntity > 0)
        
    }

    //MARK: PetDetails
    func testCoreData_PetDetails() {

        let initCount = PetDetails.countOfItemInEntity
        var currentCount = initCount

        let nameOfCoreDataEntity = UsedInAppPets.nameOfCoreDataEntity

        //* StorageManager - prepare data
        let petdetailObject1 = createNewInstanse_PetDetails(pet: nil, petRS: nil, petPhoto: nil)
        currentCount += 1

//        dataForObj.updateValue(FieldType("Dog Tuzik"), forKey: "name")
//        let petObject2 = UsedInAppPets.insertNewInstance(storage: dataStorageForTest,
//                                                         data: dataForObj,
//                                                         saveData: true)
//        currentCount += 1
//
//        //chek count
//        XCTAssertEqual(UsedInAppPets.countOfItemInEntity, currentCount)
//
//        //deleting  data
//        //* StorageManager.deleteObject
//        let petObject2Name = (petObject2 as! UsedInAppPets).name
//        StorageManager.deleteObject(entityName: ourEntityName, object: petObject2!)
//
//        currentCount -= 1
//        XCTAssertEqual(UsedInAppPets.countOfItemInEntity, currentCount)
//
//        //try to find this item
//        let predicate2 = NSPredicate(format: "name == %@", petObject2Name!)
//        let allItems2 = UsedInAppPets.getItems(predicate: predicate2)
//        XCTAssertFalse(allItems2?.count != 0)
//
//
//        //* StorageManager.saveAllContext
//        let mov = StorageManager.getManagedObjectContext(ourEntityName)
//        dataForObj.updateValue(FieldType("Dog Suzja2"), forKey: "name")
//        _ = UsedInAppPets.insertNewInstance(storage: dataStorageForTest,
//                                            data: dataForObj,
//                                            saveData: false)
//
//        StorageManager.saveContext(mo: mov)
//        currentCount += 1
//        XCTAssertEqual(UsedInAppPets.countOfItemInEntity, currentCount)
//
//        StorageManager.saveAllContext()
//
//        let predicateSearchValue = dataForObj["name"]?.unwrapWithCasting()
//        let predicate4 = NSPredicate(format: "name == %@", predicateSearchValue!)
//        let allItems4 = UsedInAppPets.getItems(predicate: predicate4)
//        XCTAssertFalse(allItems4?.count == 0)
//
//        //* StorageManager.deleteAllData
//        StorageManager.deleteAllData(entityName: nameOfCoreDataEntity)
//        XCTAssertFalse(UsedInAppPets.countOfItemInEntity > 0)
        
    }

    private func createNewInstanse_PetDetails(pet:UsedInAppPets?,
                                              petRS:ReminderSet?,
                                              petPhoto:PetPhoto?) -> PetDetails {

        var dataForObj = PetDetails.fields
        dataForObj["pet"]  = FieldType(pet)
        dataForObj["petRS"] = FieldType(petRS)
        dataForObj["petPhoto"] =  FieldType(petPhoto)

        let newInstanseObject = PetDetails.insertNewInstance(storage: dataStorageForTest,
                                         data: dataForObj,
                                         saveData: true) as! PetDetails

        return newInstanseObject

    }

    //MARK: PetDetails
    func testCoreData_PetPhoto() {
  
        let initCount = PetPhoto.countOfItemInEntity
        var currentCount = initCount

        let nameOfCoreDataEntity = PetPhoto.nameOfCoreDataEntity

        //* StorageManager - prepare data
        let dictionaryOfTestableImages = ImageWork.testImageDictionary;

        let petPhotoSad = createNewInstanse_PetPhoto(dict: dictionaryOfTestableImages,
                                                        photoCategory: PhotoCategory.sad,
                                                        photoDetail: nil)
        currentCount += 1
    }

    private func createNewInstanse_PetPhoto(dict: [PhotoCategory: NSData],
                                              photoCategory: PhotoCategory,
                                              photoDetail: PetDetails?) -> PetPhoto {

        let petPhoto: NSData? = dict[photoCategory]
        var dataForObj = PetPhoto.fields

        dataForObj["petPhoto"]  = FieldType(petPhoto)
        dataForObj["photoCategory"] = FieldType(photoCategory)
        dataForObj["photoDetail"] =  FieldType(petPhoto)

        let newInstanseObject = PetPhoto.insertNewInstance(storage: dataStorageForTest,
                                                             data: dataForObj,
                                                             saveData: true) as! PetPhoto

        return newInstanseObject
    }

    //MARK: - inner functions

    
}
