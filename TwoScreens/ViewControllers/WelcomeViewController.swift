//
//  WelcomViewController.swift
//  TwoScreens
//
//  Created by Arseniy Oksenoyt on 02.07.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    @IBOutlet var colorView: UIView!
    
    var user = ""
    
    private let primaryColor = UIColor(
        red: 252/255,
        green: 238/255,
        blue: 33/255,
        alpha: 1
    )
    
    private let secondaryColor = UIColor(
        red: 107/255,
        green: 148/255,
        blue: 230/255,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [primaryColor.cgColor, secondaryColor.cgColor]
        gradientLayer.shouldRasterize = true // Для оптимизации и только
        colorView.layer.addSublayer(gradientLayer)
        
        welcomeLabel.text = "Welcome, \(user) \u{1F60A}"
    }
}
