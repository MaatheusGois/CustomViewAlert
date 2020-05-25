//
//  UIViewController+Extentions.swift
//  CustomAlertView
//
//  Created by Matheus Silva on 25/05/20.
//  Copyright © 2020 dluque. All rights reserved.
//

import UIKit

public extension UIViewController {
    func showCustomAlert(title: String,
                         message: String,
                         withCompletion completion: @escaping (Bool) -> Void) {
        
        guard let customAlert = UIStoryboard(name: "CustomAlertView", bundle: nil)
            .instantiateViewController(withIdentifier: "CustomAlertID") as? CustomAlertView else {
            return
        }
        
        customAlert.titleAlert = title
        customAlert.messageAlert = message
        
        customAlert.providesPresentationContextTransitionStyle = true
        customAlert.definesPresentationContext = true
        customAlert.modalPresentationStyle = .overCurrentContext
        customAlert.modalTransitionStyle = .crossDissolve
        
        customAlert.comfirmMoreDidTap { (answer) in
            completion(answer)
        }
        
        self.present(customAlert, animated: true, completion: nil)
    }
}
