//
//  Meal.swift
//  eggplant-brownie1
//
//  Created by João Pedro Campos on 30/10/21.
//

import UIKit 

class Meal: NSObject, NSCoding {
    let name: String
    let hapiness: Int
    let foods: [Food]

    init(name: String, hapiness: Int, foods: [Food] = []) {
        self.name = name
        self.hapiness = hapiness
        self.foods = foods
    }

    // MARK: - NSCoding

    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(hapiness, forKey: "hapiness")
        coder.encode(foods, forKey: "foods")
    }

    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as! String
        hapiness = coder.decodeInteger(forKey: "hapiness")
        foods = coder.decodeObject(forKey: "foods") as! [Food]
    }

    // MARK: - Methods

    func calculateTotalCalories () -> Double {
        var total: Double = 0

        for food in self.foods {
            total += food.calory
        }

        return total
    }

    func getIngredientsMessage() -> String {
        var alertMessage = "Felicidade \(self.hapiness)\n"

        for food in self.foods {
            alertMessage += "\(food.name)\n"
        }

        return alertMessage
    }
}
