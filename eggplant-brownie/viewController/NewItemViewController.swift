//
//  NewItemViewController.swift
//  eggplant-brownie
//
//  Created by Patrick Souza on 05/03/19.
//  Copyright © 2019 Patrick Souza. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {
    @IBOutlet var nameField : UITextField?
    @IBOutlet var caloriesField: UITextField?
    var addAnItemDelegate: AddAnItemDelegate?
    
    @IBAction func addItem () {
        if let name = self.nameField?.text, let calories = Double(self.caloriesField!.text!){
            let item = Item(name: name, calories: calories)
            print("Adding item \(item.name)")
            
            if let delegate = addAnItemDelegate{
             delegate.add(item)
            }
            
            if let navigation = navigationController{
                navigation.popViewController(animated: true)
            }
        }
    }
}
