//
//  ViewController.swift
//  eggplant-brownie1
//
//  Created by João Pedro Campos on 30/10/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddFoodDelegate {

    // MARK: - Atrributes

    var delegate: MealsTableViewControllerDelegate?
    var ingredients: [Food] = [
        Food(name: "Molho de Tomate", calory: 5.0),
        Food(name: "Queijo", calory: 40.0),
        Food(name: "Molho Pesto", calory: 17.1),
        Food(name: "Maionese", calory: 150.0)
    ]
    var selectedIngredients: [Food] = []

    // MARK: - IBOutlets

    
    @IBOutlet weak var foodsTableView: UITableView?
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        let addFoodButton = UIBarButtonItem(title: "Adicionar", style: .plain, target: self, action: #selector(addFood))

        navigationItem.rightBarButtonItem = addFoodButton

        guard let savedIngredients = FoodDAO().load() else { return }

        ingredients = savedIngredients
    }

    @objc func addFood () {
        let addIngredientsViewController = AddIngredientsViewController(delegate: self)
        navigationController?.pushViewController(addIngredientsViewController, animated: true)
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let row = indexPath.row

        cell.textLabel?.text = ingredients[row].name

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count;
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }

        if cell.accessoryType == .none {
            cell.accessoryType = .checkmark

            let tableRow = indexPath.row
            selectedIngredients.append(ingredients[tableRow])
        } else {
            cell.accessoryType = .none

            let item = ingredients[indexPath.row]
            if let position = selectedIngredients.firstIndex(of: item) {
                selectedIngredients.remove(at: position)
            }
        }
    }

    // MARK: - IBActions

    @IBAction func adicionar() {
        guard let meal = self.getMealObject() else {
            Alert(message: "Erro ao ler formulário", title: "Erro", buttonMessage: "Ok", viewController: self).showAlert()
            return
        }

        print("Comi \(meal.name) e fiquei com felicidade: \(meal.hapiness)")

        delegate?.addMeal(meal)

        navigationController?.popViewController(animated: true)
    }

    // MARK: - Methods

    func getMealObject() -> Meal? {
        guard let mealName = nomeTextField?.text else {
            return nil
        }

        guard let mealHapiness = felicidadeTextField?.text, let hapiness = Int(mealHapiness) else {
            return nil
        }

        let meal = Meal(name: mealName, hapiness: hapiness, foods: selectedIngredients)

        return meal
    }

    func addMeal(_ food: Food) -> Void {
        if let tableView = foodsTableView {
            self.saveIngredients(food)
            tableView.reloadData()
        } else {
            let alert = Alert(message: "Problema ao adicionar ingrediente", title: "Erro", buttonMessage: "Ok", viewController: self)

            alert.showAlert()
        }
    }

    func saveIngredients(_ food: Food) -> Void {
        ingredients.append(food)

        FoodDAO().save(ingredients)
    }

}

