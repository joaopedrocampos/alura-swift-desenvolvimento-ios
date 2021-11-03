//
//  MealDAO.swift
//  eggplant-brownie1
//
//  Created by João Pedro Campos on 03/11/21.
//

import Foundation

class MealDAO {
    func save(_ meals: [Meal]) {
        guard let path = self.getFolder() else { return }

        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: meals, requiringSecureCoding: false)
            try data.write(to: path)
        } catch {
            print("Erro inesperado \(error.localizedDescription)")
        }
    }

    func load() -> [Meal]? {
        guard let path = self.getFolder() else { return nil }

        do {
            let data = try Data(contentsOf: path)
            guard let savedMeals = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Meal] else { return nil }

            return savedMeals
        } catch {
            print(error.localizedDescription)
            return []
        }
    }

    func getFolder() -> URL? {
        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let path = directory.appendingPathComponent("meal")

        return path
    }
}
