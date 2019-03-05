//
//  meal.swift
//  eggplant-brownie
//
//  Created by Patrick Souza on 04/03/19.
//  Copyright © 2019 Patrick Souza. All rights reserved.
//

import Foundation

class Meal {
    let name:String
    let happiness:Int
    let items:Array<Item>
    
    init(name: String,happiness:Int, items:Array<Item> = []){
        self.name = name
        self.happiness = happiness
        self.items = items
    }
    
    func allCalories() -> Double{
        var total = 0.0
        
        for i in items{
            total += i.calories
        }
        return total
    }
    func details() -> String{
        var message = "happiness: \(self.happiness)"
        for item in self.items{
            message += "\n \(item.name) - calories: \(item.calories)"
        }
        return message
    }
}
