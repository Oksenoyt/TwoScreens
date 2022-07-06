//
//  ViewController.swift
//  TwoScreens
//
//  Created by Arseniy Oksenoyt on 06.07.2022.
//

import UIKit

class PersonalInfoViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    @IBOutlet var personalInfoLabel: UILabel!
    
    var gradientLayer: CAGradientLayer!
    var personalInfo: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.addSublayer(gradientLayer)
        personalInfoLabel.text = personalInfo
    }
    
}
