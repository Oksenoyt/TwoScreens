//
//  ViewController.swift
//  TwoScreens
//
//  Created by Elena Kholodilina on 02.07.2022.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var userNameRemindButton: UIButton!
    @IBOutlet var passwordRemindButton: UIButton!
    
    let userName = "User"
    let password = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }

    @IBAction func logInButtonPressed() {
    }
    
    @IBAction func forgotLogInButtonPressed() {
        showAlert(with: "Oops!", and: "Your user name is \(userName)")
    }
    
    @IBAction func forgotPassButtonPressed() {
        showAlert(with: "Oops!", and: "Your password is \(password)")
    }
    
    
}

extension LogInViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
