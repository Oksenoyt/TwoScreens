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
    
    private let userName = "user"
    private let password = "password"
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let welcomeVC = segue.destination as? WelcomeViewController
//        else { return }
//
//        welcomeVC.user = (userNameTextField.text ?? "")
//        welcomeVC.modalPresentationStyle = .fullScreen
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        viewControllers.forEach { viewController in
            if let firstVC = viewController as? WelcomeViewController {
                firstVC.user = (userNameTextField.text ?? "")
                firstVC.modalPresentationStyle = .fullScreen
            } else if let secondVC = viewController as? PersonalInfoViewController {
                secondVC.view.backgroundColor = .yellow
            }
        }
    }
    
    @IBAction func logInButtonPressed() {
        guard userNameTextField.text == userName, passwordTextField.text == password else {
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
        ? showAlert(title: "Oops!", message: "Your user name is: \(userName)")
        : showAlert(title: "Oops!", message: "Your password is: \(password)")
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
}
