//
//  ViewController.swift
//  TwoScreens
//
//  Created by Arseniy Oksenoyt on 02.07.2022.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let user = User.getUser()
    
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        viewControllers.forEach { viewController in
            if let firstVC = viewController as? WelcomeViewController {
                firstVC.login = "\(user.person.firstName) \(user.person.familyName)"
                firstVC.modalPresentationStyle = .fullScreen
                firstVC.gradientLayer = getColor(mainColor: primaryColor, secondColor: secondaryColor)
            } else if let secondVC = viewController as? PersonalInfoViewController {
//                secondVC.view.backgroundColor = .systemYellow
                secondVC.personalInfo = user.person.description
                secondVC.gradientLayer = getColor(mainColor: primaryColor, secondColor: secondaryColor)
            } else if let thirdVC = viewController as? PhotosViewController {
                thirdVC.userPhoto = UIImage(named: user.person.photo)
            }
        }
    }
    
    @IBAction func logInButtonPressed() {
        guard userNameTextField.text == user.login,
              passwordTextField.text == user.password else {
            showAlert(
                title: "Damn, that sucks! \u{1f600}",
                message: "Wrong Login or Password. Try again, man!"
            )
            return
        }
        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
    }
    
    @IBAction func forgotRegistrationData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops!", message: "Your user name is: \(user.login)")
        : showAlert(title: "Oops!", message: "Your password is: \(user.password)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text?.removeAll()
        passwordTextField.text?.removeAll()
    }
    
}

extension LogInViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.passwordTextField.text?.removeAll()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func getColor(mainColor: UIColor, secondColor: UIColor) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [primaryColor.cgColor, secondaryColor.cgColor]
        gradientLayer.shouldRasterize = true // Для оптимизации и только
        
        return gradientLayer
    }
}
