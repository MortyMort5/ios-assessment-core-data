//
//  ShoppingListTableViewCell.swift
//  ShoppingList
//
//  Created by Sterling Mortensen on 2/10/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {

    weak var delegate: buttonCellCheckBoxDelegate?
    @IBOutlet weak var nameTextField: UILabel!
    @IBOutlet weak var checkBoxButton: UIButton!

    @IBAction func checkBoxButtonTapped(_ sender: Any) {
        delegate?.checkBoxButtonCell(sender: self)
    }
    
    var shoppingList: ShoppingList? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let shoppingList = shoppingList else { return }
        
        nameTextField.text = shoppingList.name
        
        let image = shoppingList.purchased ? #imageLiteral(resourceName: "complete") : #imageLiteral(resourceName: "incomplete")
        checkBoxButton.setImage(image, for: .normal)
        
    }
    
    
    
}

protocol buttonCellCheckBoxDelegate: class {
    func checkBoxButtonCell(sender: ShoppingListTableViewCell)
}
