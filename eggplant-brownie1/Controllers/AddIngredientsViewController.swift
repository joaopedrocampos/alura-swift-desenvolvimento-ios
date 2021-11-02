//
//  AddIngredientsViewController.swift
//  eggplant-brownie1
//
//  Created by João Pedro Campos on 02/11/21.
//

import UIKit

protocol AddFoodDelegate {
    func addMeal(_ food: Food)
}

class AddIngredientsViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var nameTextField: UITextField?
    @IBOutlet weak var caloriesTextField: UITextField?

    // MARK: - Attributes

    var delegate: AddFoodDelegate?

    init(delegate: AddFoodDelegate) {
        super.init(nibName: "AddIngredientsViewController", bundle: nil)
        self.delegate = delegate
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IBActions

    @IBAction func addFood(_ sender: Any) {
        guard let foodName = nameTextField?.text else { return }
        guard let foodCalories = caloriesTextField?.text, let calories = Double(foodCalories) else { return }

        let food = Food(name: foodName, calory: calories)

        delegate?.addMeal(food)

        navigationController?.popViewController(animated: true)
    }

}
