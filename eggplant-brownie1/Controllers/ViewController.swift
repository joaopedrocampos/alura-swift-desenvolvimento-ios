//
//  ViewController.swift
//  eggplant-brownie1
//
//  Created by João Pedro Campos on 30/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?

    @IBAction func adicionar() {
//        if let mealName = nomeTextField?.text, let mealHapinnes = felicidadeTextField?.text {
//            if let felicidade = Int(mealHapinnes) {
//                let meal = Meal(name: mealName, hapiness: felicidade)
//
//                print("Comi \(meal.name) e fiquei com felicidade: \(meal.hapiness)")
//            } else {
//                print("Felicidade inválida, por favor digite um número")
//            }
//        }

        guard let mealName = nomeTextField?.text else {
            print("Nome é obrigatório")
            return
        }

        guard let mealHapiness = felicidadeTextField?.text, let hapiness = Int(mealHapiness) else {
            print("Felicidade é obrigatório")
            return
        }

        let meal = Meal(name: mealName, hapiness: hapiness)

        print("Comi \(meal.name) e fiquei com felicidade: \(meal.hapiness)")
    }

}

