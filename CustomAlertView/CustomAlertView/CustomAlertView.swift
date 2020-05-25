//
//  CustomAlertView.swift
//  CustomAlertView
//
//  Created by Daniel Luque Quintana on 16/3/17.
//  Copyright © 2017 dluque. All rights reserved.
//

import UIKit

public class CustomAlertView: UIViewController {
    
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var messageLabel: UILabel!
    @IBOutlet weak private var alertView: UIView!
    @IBOutlet weak private var cancelButton: UIButton!
    @IBOutlet weak private var okButton: UIButton!
    
    public var titleAlert: String = ""
    public var messageAlert: String = ""
    
    private var confirmDidTapHandler: ((Bool) -> Void)?
    
    private let alertViewGrayColor = UIColor(red: 224.0/255.0, green: 224.0/255.0, blue: 224.0/255.0, alpha: 1)
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleAlert
        messageLabel.text = messageAlert
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
        animateView()
    }
    
    func setupView() {
        alertView.layer.cornerRadius = 15
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }
    
    func animateView() {
        alertView.alpha = 0;
        self.alertView.frame.origin.y = self.alertView.frame.origin.y + 50
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            self.alertView.alpha = 1.0;
            self.alertView.frame.origin.y = self.alertView.frame.origin.y - 50
        })
    }
    
    func comfirmMoreDidTap(_ handler: @escaping (Bool) -> Void) {
        self.confirmDidTapHandler = handler
    }
    
    @IBAction func onTapCancelButton(_ sender: Any) {
        self.confirmDidTapHandler?(false)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onTapOkButton(_ sender: Any) {
        self.confirmDidTapHandler?(true)
        self.dismiss(animated: true, completion: nil)
    }
}
