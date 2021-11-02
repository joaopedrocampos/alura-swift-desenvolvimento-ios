//
//  Meal.swift
//  eggplant-brownie1
//
//  Created by João Pedro Campos on 30/10/21.
//

import UIKit 

class Meal: NSObject {
    let name: String
    let hapiness: Int
    let foods: [Food]

    init(name: String, hapiness: Int, foods: [Food] = []) {
        self.name = name
        self.hapiness = hapiness
        self.foods = foods
    }

    func calculateTotalCalories () -> Double {
        var total: Double = 0

        for food in self.foods {
            total += food.calory
        }

        return total
    }
}
