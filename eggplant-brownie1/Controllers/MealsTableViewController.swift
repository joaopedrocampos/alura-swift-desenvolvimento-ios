//
//  MealsTableViewController.swift
//  eggplant-brownie1
//
//  Created by João Pedro Campos on 30/10/21.
//

import UIKit

protocol MealsTableViewControllerDelegate {
    func addMeal(_ meal: Meal) -> Void
}

class MealsTableViewController: UITableViewController, MealsTableViewControllerDelegate {

    var meals = [
        Meal(name: "Macarronada", hapiness: 5),
        Meal(name: "Feijoada", hapiness: 3),
        Meal(name: "Abacate", hapiness: 5)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        print("MealsTableViewController loaded")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let meal = meals[indexPath.row]

        cell.textLabel?.text = meal.name

        return cell
    }

    func addMeal(_ meal: Meal) -> Void {
        meals.append(meal)

        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addMeal" {
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
            }
        }
    }

}
