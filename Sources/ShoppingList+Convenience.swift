//
//  ShoppingList+Convenience.swift
//  ShoppingList
//
//  Created by Sterling Mortensen on 2/10/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import Foundation
import CoreData


extension ShoppingList {
    @discardableResult convenience init(name: String, purchased: Bool = false, context: NSManagedObjectContext = Stack.context) {
        
        self.init(context: context)
        self.name = name
        self.purchased = purchased
        
    }


}

