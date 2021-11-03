//
//  Food.swift
//  eggplant-brownie1
//
//  Created by João Pedro Campos on 30/10/21.
//

import UIKit

class Food: NSObject, NSCoding {
    let name: String
    let calory: Double

    init(name: String, calory: Double) {
        self.name = name
        self.calory = calory
    }

    // MARK: - NSCoding

    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(calory, forKey: "calory")
    }

    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as! String
        calory = coder.decodeDouble(forKey: "calory")
    }
}
