//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Patrick Souza on 04/03/19.
//  Copyright © 2019 Patrick Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate {
    
    @IBOutlet var nameField: UITextField?
    @IBOutlet var happinessField: UITextField?
    var mealDelegate: addAMealDelegate?
    var items = [
        Item(name: "Eggplant", calories: 10),
        Item(name: "Brownie", calories: 10),
        Item(name: "Zucchini", calories: 10),
        Item(name: "Muffin", calories: 10),
        Item(name: "Coconut oil", calories: 500),
        Item(name: "Chocolate frosting", calories: 1000),
        Item(name: "Chocolate chip", calories: 1000),
        ]
    var selected:Array<Item> = []
    @IBOutlet var tableView: UITableView?
    
    func add(_ item: Item) {
        items.append(item)
        
        if let tableView = self.tableView{
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "New Item", style: UIBarButtonItem.Style.plain, target: self, action: #selector(showNewItem))
        navigationItem.rightBarButtonItem = newItemButton
    }
    
    @objc func showNewItem(){
        let newItem = NewItemViewController()
        newItem.addAnItemDelegate = self
        
        if let navihgation = navigationController{
            navihgation.pushViewController(newItem, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if let cell = cell{
            if cell.accessoryType == UITableViewCell.AccessoryType.none{
                cell.accessoryType = UITableViewCell.AccessoryType.checkmark
                let item = items[indexPath.row]
                self.selected.append(item)
            }else{
                if let position = selected.firstIndex(of: items[indexPath.row]){
                    selected.remove(at: position)
                }
                
                cell.accessoryType = UITableViewCell.AccessoryType.none
            }
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = item.name
        
        return cell
    }
    
    @IBAction func add() {
        if nameField == nil || happinessField == nil {
            return
        }
        
        let name = nameField!.text!
        if let happiness:Int = Int(happinessField!.text!){
        
            let meal = Meal(name: name, happiness: happiness, items: self.selected)
        
        if mealDelegate == nil {
            return
        }
        
        mealDelegate!.add(meal)
        
        
        if let navigation = self.navigationController{
            navigation.popViewController(animated: true)
        }
        
        print("eaten: \(meal.name) and happiness \(meal.happiness)")
        }
    }
    
}

