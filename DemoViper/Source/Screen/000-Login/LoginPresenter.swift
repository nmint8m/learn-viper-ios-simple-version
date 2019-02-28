//
//  LoginPresenter.swift
//  DemoViper
//
//  Created by Tam Nguyen M. on 1/17/19.
//  Copyright © 2019 Tam Nguyen M. All rights reserved.
//

import UIKit

// MARK: - LoginPresenterProtocol
protocol LoginPresenterProtocol: LoginViewHandler {
    var view: LoginViewProtocol? { get set }
    var router: LoginRouter? { get set }
    var interactor: LoginInteractorProtocol? { get set }
}

final class LoginPresenter: LoginPresenterProtocol {

    // MARK: - Properties
    private var isNeededValidate = false

    // MARK: - LoginPresenterProtocol
    weak var view: LoginViewProtocol?
    var router: LoginRouter?
    var interactor: LoginInteractorProtocol?

    // MARK: - Functions
    func showValidateError(_ error: Error) {
        if let error = error as? UsernameError {
            view?.showUsernameError(error.localizedDescription)
        } else if let error = error as? PasswordError {
            view?.showPasswordError(error.localizedDescription)
        } else {
            router?.showError(error)
        }
    }
}

// MARK: - LoginViewHandler
extension LoginPresenter {
    func validateUsername(_ username: String?) {
        guard isNeededValidate else { return }
        do {
            try interactor?.validateUsername(username)
        } catch (let error) {
            showValidateError(error)
            return
        }
        view?.showUsernameError("")
    }

    func validatePassword(_ password: String?) {
        guard isNeededValidate else { return }
        do {
            try interactor?.validatePassword(password)
        } catch (let error) {
            showValidateError(error)
            return
        }
        view?.showPasswordError("")
    }

    func login(username: String?, password: String?) {
        isNeededValidate = true
        do {
            try interactor?.login(username: username, password: password) { [weak self] result in
                guard let this = self else { return }
                switch result {
                case .success:
                    this.router?.showScreen(type: .categoryModule)
                case .failure(let error):
                    this.showValidateError(error)
                }
            }
        } catch {
            showValidateError(error)
        }
    }
}
