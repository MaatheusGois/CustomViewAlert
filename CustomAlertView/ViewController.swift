//
//  ViewController.swift
//  CustomAlertView
//
//  Created by Daniel Luque Quintana on 16/3/17.
//  Copyright © 2017 dluque. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func onTapCustomAlertButton(_ sender: Any) {
        self.showCustomAlert(
            title: "Título",
            message: "Esse medium fala sobre as principais causas de errarmos quando fazemos as contas..."
        ) { answer in
            print(answer)
        }
    }
}
