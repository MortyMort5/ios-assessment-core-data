//
//  ShoppingListTableViewController.swift
//  ShoppingList
//
//  Created by Sterling Mortensen on 2/10/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import UIKit

class ShoppingListTableViewController: UITableViewController, buttonCellCheckBoxDelegate {

    @IBAction func addButtonTapped(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Add Item", message: "Shopping List Items", preferredStyle: .alert)
        
        var itemName: UITextField?
        alertController.addTextField { (textField) in
            itemName = textField
        }
    
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let submitAction = UIAlertAction(title: "Submit", style: .default) { (_) in
            guard let title = itemName?.text else { return }
            ShoppingListController.shared.create(withName: title)
            self.tableView.reloadData()
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(submitAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func checkBoxButtonCell(sender: ShoppingListTableViewCell) {
        guard let shoppingList = sender.shoppingList,
            let indexPath = tableView.indexPath(for: sender) else { return }
        ShoppingListController.shared.toggleCheckBoxButton(shoppingList: shoppingList)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShoppingListController.shared.shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingListCell", for: indexPath) as? ShoppingListTableViewCell else { return ShoppingListTableViewCell() }
        
        let shoppingList = ShoppingListController.shared.shoppingList[indexPath.row]
        cell.shoppingList = shoppingList
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let shoppingList = ShoppingListController.shared.shoppingList[indexPath.row]
            ShoppingListController.shared.delete(shoppingList: shoppingList)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
