//
//  ShoppingListController.swift
//  ShoppingList
//
//  Created by Sterling Mortensen on 2/10/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class ShoppingListController {
    
    static let shared = ShoppingListController()
    
    // MARK: - Create
    func create(withName name: String) {
        let _ = ShoppingList(name: name)
        saveToPersistentStore()
    }
    
    // MARK: - Read
    var shoppingList: [ShoppingList] {
        let request: NSFetchRequest<ShoppingList> = ShoppingList.fetchRequest()
        let moc = Stack.context
        
        do {
            return try moc.fetch(request)
        } catch  {
            return []
        }
    }
    
    // MARK: - Update
    func toggleCheckBoxButton(shoppingList: ShoppingList) {
        shoppingList.purchased = !shoppingList.purchased
        saveToPersistentStore()
    }
    
    // MARK: - Delete
    
    func delete(shoppingList: ShoppingList) {
        let moc = Stack.context
        moc.delete(shoppingList)
        saveToPersistentStore()
    }
    
    
    func saveToPersistentStore() {
        let moc = Stack.context
        
        do {
            try moc.save()
        } catch let error {
            print("There is a problem saving to the persistent store: \n\(error)")
        }
    }
    
}
