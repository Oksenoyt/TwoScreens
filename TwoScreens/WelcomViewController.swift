//
//  WelcomViewController.swift
//  TwoScreens
//
//  Created by Elena Kholodilina on 02.07.2022.
//

import UIKit

class WelcomViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var welcomeValue: String!
    var defaultTextField: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(welcomeValue ?? "")"
    }
    
    @IBAction func logOutButtonPressed() {
        dismiss(animated: true)
        defaultTextField = ""
    }
    
}
