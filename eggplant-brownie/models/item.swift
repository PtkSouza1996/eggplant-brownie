//
//  item.swift
//  eggplant-brownie
//
//  Created by Patrick Souza on 04/03/19.
//  Copyright © 2019 Patrick Souza. All rights reserved.
//

import Foundation

class Item: Equatable {
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name && lhs.calories == rhs.calories
    }
    
    let name: String
    let calories: Double
    init(name:String,calories:Double) {
        self.name = name
        self.calories = calories
    }
}
