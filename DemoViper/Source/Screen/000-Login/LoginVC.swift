//
//  LoginVC.swift
//  UnittestExample
//
//  Created by Tung Nguyen C.T on 9/13/18.
//  Copyright © 2018 IOS Testing. All rights reserved.
//

import UIKit


// MARK: LoginViewProtocol
protocol LoginViewProtocol: class {

    var handler: LoginViewHandler? { get set }

    func showUsernameError(_ message: String)
    func showPasswordError(_ message: String)
}

// MARK: - LoginViewHandler
protocol LoginViewHandler {

    // Datasource

    // Delegate
    func validateUsername(_ username: String?)
    func validatePassword(_ password: String?)
    func login(username: String?, password: String?)
}

final class LoginVC: UIViewController, LoginViewProtocol {

    // MARK: - Properties

    // MARK: - IBOutlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var usernameErrorLabel: UILabel!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var passwordErrorLabel: UILabel!
    @IBOutlet private weak var loginButton: UIButton!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameErrorLabel.text = ""
        passwordErrorLabel.text = ""
    }

    // MARK: - IBActions
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        guard let text = sender.text else { return }
        switch sender {
        case usernameTextField:
            handler?.validateUsername(text)
        case passwordTextField:
            handler?.validatePassword(text)
        default: break
        }
    }

    @IBAction func loginButtonTouchInside(_ sender: UIButton) {
        let username = usernameTextField.text
        let password = passwordTextField.text
        handler?.login(username: username, password: password)
    }

    // MARK: - LoginViewProtocol
    var handler: LoginViewHandler?

    func showUsernameError(_ message: String) {
        usernameErrorLabel.text = message
    }

    func showPasswordError(_ message: String) {
        passwordErrorLabel.text = message
    }
}
