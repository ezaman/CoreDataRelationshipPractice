//
//  Datastore.swift
//  CoreDataAssessment1272016
//
//  Created by Ehsan Zaman on 12/7/16.
//  Copyright © 2016 Ehsan Zaman. All rights reserved.
//

import Foundation
import CoreData

class datastore {
    
    private init() {}
    
    static let shared = datastore()
    
    var hospitals: [Hospital] = []
    var vets: [Vet] = []
    var pets: [Pet] = []
    
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "CoreDataAssessment1272016")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
          
                print("Error Saving Context")
            }
        }
    }

    
    func testData() {
///
        let hospitalOne: Hospital = NSEntityDescription.insertNewObject(forEntityName: "Hospital", into: persistentContainer.viewContext) as! Hospital
        hospitalOne.name = "Manhattan Hospital"
        
        let vetOne: Vet = NSEntityDescription.insertNewObject(forEntityName: "Vet", into: persistentContainer.viewContext) as! Vet
        vetOne.name = "Dr J"
        
       // hospitalOne.vets?.setValue(vetOne, forKey: "")
       //hospitalOne.vets!.setValue(vetOne, forKey: "name")
        
        vetOne.hospitals!.adding(hospitalOne)
        
        let petOne: Pet = NSEntityDescription.insertNewObject(forEntityName: "Pet", into: persistentContainer.viewContext) as! Pet
        petOne.name = "Leo"
        
        vetOne.pets?.adding(petOne)
        petOne.hospital = hospitalOne
        petOne.vet = vetOne
///
        let hospitalTwo: Hospital = NSEntityDescription.insertNewObject(forEntityName: "Hospital", into: persistentContainer.viewContext) as! Hospital
        hospitalTwo.name = "Bronx Hospital"
        
        let vetTwo: Vet = NSEntityDescription.insertNewObject(forEntityName: "Vet", into: persistentContainer.viewContext) as! Vet
        vetTwo.name = "Dr Zizmor"
        
        hospitalTwo.vets?.adding(vetTwo)
        vetTwo.hospitals?.adding(hospitalTwo)
        
        let petTwo: Pet = NSEntityDescription.insertNewObject(forEntityName: "Pet", into: persistentContainer.viewContext) as! Pet
        petTwo.name = "Rocko"
        petTwo.hospital = hospitalTwo
        
        vetTwo.pets?.adding(petTwo)
        petTwo.vet = vetTwo
        petTwo.hospital = hospitalTwo
        
///
        let hospitalThree: Hospital = NSEntityDescription.insertNewObject(forEntityName: "Hospital", into: persistentContainer.viewContext) as! Hospital
        hospitalThree.name = "Queens Hospital"
        
        let vetThree: Vet = NSEntityDescription.insertNewObject(forEntityName: "Vet", into: persistentContainer.viewContext) as! Vet
        vetThree.name = "Dr Strange"
        
        hospitalThree.vets?.adding(vetThree)
        vetThree.hospitals?.adding(hospitalThree)
        
        let petThree: Pet = NSEntityDescription.insertNewObject(forEntityName: "Pet", into: persistentContainer.viewContext) as! Pet
        petThree.name = "Tony"
        
        vetThree.pets?.adding(petThree)
        
        petThree.vet = vetThree
        petThree.hospital = hospitalThree
        
        
        saveContext()
        fetch()
        
    }

    
    func fetch() {
        
        var error: NSError? = nil
        
        let hospitalData = NSFetchRequest<NSFetchRequestResult>(entityName: "Hospital")
        let vetData = NSFetchRequest<NSFetchRequestResult>(entityName: "Vet")
        let petData = NSFetchRequest<NSFetchRequestResult>(entityName: "Pet")
        
        let hospitalSort = NSSortDescriptor(key: "name", ascending: true)
        hospitalData.sortDescriptors = [hospitalSort]
        
        do {
            hospitals = try persistentContainer.viewContext.fetch(hospitalData) as! [Hospital]
            vets = try persistentContainer.viewContext.fetch(vetData) as! [Vet]
            pets = try persistentContainer.viewContext.fetch(petData) as! [Pet]
        }
            
        catch let NSError as NSError{

            print(error)
      
        }
        
        if hospitals.count == 0{
            if vets.count == 0 || pets.count == 0{
                self.testData()
            }
        }

        
        
        
    }
    
    
    
    
    
}
