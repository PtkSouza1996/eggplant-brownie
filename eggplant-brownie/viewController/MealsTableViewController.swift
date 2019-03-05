//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Patrick Souza on 04/03/19.
//  Copyright © 2019 Patrick Souza. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, addAMealDelegate {

    var meals = [Meal(name: "sundubu", happiness: 5), Meal(name: "cheesecake", happiness: 3)]

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        
        cell.textLabel!.text = meal.name
        let longPressRecognized = UILongPressGestureRecognizer(target: self, action: #selector(showDetails))
        
        cell.addGestureRecognizer(longPressRecognized)
        
        return cell
    }
    
    @objc func showDetails(recognizer: UILongPressGestureRecognizer){
        if recognizer.state == UILongPressGestureRecognizer.State.began{
            let cell = recognizer.view as! UITableViewCell
            if let indexPath = self.tableView.indexPath(for: cell){
                let meal = meals[indexPath.row]
                
                let alert = UIAlertController(title: meal.name, message: meal.details(), preferredStyle: UIAlertController.Style.alert)
                let buttonOk = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(buttonOk)
                
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "addMeal"{
            let view = segue.destination as? ViewController
            view!.mealDelegate = self
        }
    }
    func add(_ meal: Meal) {
        self.meals.append(meal)
        
        tableView.reloadData()
    }
    
}
