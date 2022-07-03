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
    
    let userName = "user"
    let password = "password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController
        else { return }
        
        welcomeVC.welcomeValue = userNameTextField.text
        welcomeVC.modalPresentationStyle = .fullScreen
    }
    
    @IBAction func logInButtonPressed() {
        if (userNameTextField.text?.isEmpty ?? false) || (passwordTextField.text?.isEmpty ?? false) {
            textFieldIsEmpty()
        } else {
            guard userNameTextField.text == userName else {
                showAlert(with: "Damn, that sucks! \u{1f600}", and: "Wrong Login or password. Try again, man!")
                return
            }
            guard passwordTextField.text == password else {
                showAlert(with: "Damn, that sucks! \u{1f600}", and: "Wrong Login or password. Try again, man!")
                return
            }
        }
    }
    
    @IBAction func forgotLogInButtonPressed() {
        showAlert(with: "Oops!", and: "Your user name is: \(userName)")
    }
    
    @IBAction func forgotPassButtonPressed() {
        showAlert(with: "Oops!", and: "Your password is: \(password)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text?.removeAll()
        passwordTextField.text?.removeAll()
    }
    
}

extension LogInViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.passwordTextField.text?.removeAll()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func textFieldIsEmpty() {
        if (userNameTextField.text?.isEmpty ?? false) && (passwordTextField.text?.isEmpty ?? false) {
            showAlert(with: "Oops!", and: "Please, enter Login and Password!")
        } else if (userNameTextField.text?.isEmpty ?? false) {
            showAlert(with: "Oops!", and: "Please, enter Login!")
        } else if (passwordTextField.text?.isEmpty ?? false) {
            showAlert(with: "Oops!", and: "Please, enter Password")
        }
    }
}
