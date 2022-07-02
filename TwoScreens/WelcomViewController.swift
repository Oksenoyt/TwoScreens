//
//  WelcomViewController.swift
//  TwoScreens
//
//  Created by Elena Kholodilina on 02.07.2022.
//

import UIKit

class WelcomViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var colorView: UIView!
    
    var welcomeValue: String!
    var defaultTextField: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(welcomeValue ?? "")"
        
        let gradientLayer = CAGradientLayer()

        gradientLayer.frame = view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0, green: 0.5725490196, blue: 0.2705882353, alpha: 1).cgColor, UIColor(red: 252/255, green: 238/255, blue: 33/255, alpha: 1).cgColor]
        gradientLayer.shouldRasterize = true
        colorView.layer.addSublayer(gradientLayer)
    
    
    }
    
    @IBAction func logOutButtonPressed() {
        dismiss(animated: true)
        defaultTextField = ""
    }
    
}
