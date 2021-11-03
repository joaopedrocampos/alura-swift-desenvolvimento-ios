//
//  FoodDAO.swift
//  eggplant-brownie1
//
//  Created by João Pedro Campos on 03/11/21.
//

import Foundation

class FoodDAO {
    func save(_ ingredients: [Food]) -> Void {
        do {
            guard let path = self.getFolder() else { return }

            let data = try NSKeyedArchiver.archivedData(withRootObject: ingredients, requiringSecureCoding: false)
            try data.write(to: path)
        } catch {
            print(error.localizedDescription)
        }
    }

    func load() -> [Food]? {
        guard let path = self.getFolder() else { return nil }

        do {
            let data = try Data(contentsOf: path)

            guard let savedIngredients = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Food] else { return nil }

            return savedIngredients
        } catch {
            print(error.localizedDescription)
            return []
        }
    }

    func getFolder() -> URL? {
        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("Nao consegui pegar ingredients")
            return nil
        }
        let path = directory.appendingPathComponent("ingredients")

        return path
    }
}
