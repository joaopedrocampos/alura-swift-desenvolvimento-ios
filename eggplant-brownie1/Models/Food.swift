//
//  Food.swift
//  eggplant-brownie1
//
//  Created by João Pedro Campos on 30/10/21.
//

import UIKit

class Food: NSObject {
    let name: String
    let calory: Double

    init(name: String, calory: Double) {
        self.name = name
        self.calory = calory
    }
}
