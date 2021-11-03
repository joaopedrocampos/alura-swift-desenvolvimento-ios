//
//  RemoveMealController.swift
//  eggplant-brownie1
//
//  Created by João Pedro Campos on 02/11/21.
//

import UIKit

protocol RemoveMealViewControllerDelegate {
    func show(_ meal: Meal) -> Void
}

class RemoveMealViewController {

    let viewController: UIViewController

    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func show(_ meal: Meal, handler: @escaping (UIAlertAction) -> Void) -> Void {
        let alertMessage = meal.getIngredientsMessage()
        let alert = Alert(message: alertMessage, title: meal.name, buttonMessage: "Ok", viewController: self.viewController)

        alert.showRemoveAlert(removeMessage: "Remover", removeHandler: handler)
    }
}

