//
//  Alert.swift
//  eggplant-brownie1
//
//  Created by João Pedro Campos on 02/11/21.
//

import Foundation
import UIKit

class Alert {
    let message: String
    let title: String
    let buttonMessage: String
    let viewController : UIViewController

    init(message: String, title: String = "Erro", buttonMessage: String, viewController: UIViewController) {
        self.message = message
        self.title = title
        self.buttonMessage = buttonMessage
        self.viewController = viewController
    }

    // MARK: - Methods

    func showAlert() -> Void {
        let alert = UIAlertController(title: self.title, message: self.message, preferredStyle: .alert)
        let closeButton = UIAlertAction(title: self.buttonMessage, style: .cancel, handler: nil)

        alert.addAction(closeButton)

        self.viewController.present(alert, animated: true, completion: nil)
    }

    func showRemoveAlert(removeMessage: String, removeHandler: ((UIAlertAction) -> Void)?) -> Void {
        let alert = UIAlertController(title: self.title, message: self.message, preferredStyle: .alert)

        let closeButton = UIAlertAction(title: self.buttonMessage, style: .cancel, handler: nil)
        let removeButton = UIAlertAction(title: removeMessage, style: .destructive, handler: removeHandler)

        alert.addAction(closeButton)
        alert.addAction(removeButton)

        self.viewController.present(alert, animated: true, completion: nil)
    }
}
