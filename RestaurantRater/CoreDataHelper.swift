//
//  CoreDataHelper.swift
//  RestaurantRater
//
//  Created by Celes Augustus on 3/26/24.
//

import Foundation
import CoreData

class CoreDataHelper {
    static let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "YourModelName")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    static let context = persistentContainer.viewContext
    
    static func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // Add other Core Data methods as needed
}
