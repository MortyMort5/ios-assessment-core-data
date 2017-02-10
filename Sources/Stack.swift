//
//  Stack.swift
//  ShoppingList
//
//  Created by Sterling Mortensen on 2/10/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import Foundation
import CoreData

enum Stack {
    
    static let container: NSPersistentContainer =  {
        let container = NSPersistentContainer(name: "ShoppingList")
        container.loadPersistentStores(completionHandler: {(storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Error loading persistent stores: \(error.userInfo)")
            }
        })
        return container
    }()
    
    static var context: NSManagedObjectContext {return container.viewContext}
}
