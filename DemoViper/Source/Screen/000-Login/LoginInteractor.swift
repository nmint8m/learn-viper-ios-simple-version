//
//  LoginInteractor.swift
//  DemoViper
//
//  Created by Tam Nguyen M. on 1/17/19.
//  Copyright © 2019 Tam Nguyen M. All rights reserved.
//

import Foundation

// MARK: - LoginInteractorProtocol
protocol LoginInteractorProtocol {
    var entity: UserEntityProtocol? { get set }

    func validateUsername(_ username: String?) throws
    func validatePassword(_ password: String?) throws
    func login(username: String?, password: String?, completion: ((CompletionResult) -> Void)?) throws
}

// MARK: - LoginInteractor
final class LoginInteractor: LoginInteractorProtocol {

    var entity: UserEntityProtocol?

    func validateUsername(_ username: String?) throws {
        guard let username = username,
            !username.trimmed.isEmpty else {
            throw UsernameError.empty
        }

        if !username.validateRegex(.email) {
            throw UsernameError.invalid(reason: .format)
        }

        if !username.hasSuffix("@gmail.com") {
            throw UsernameError.invalid(reason: .suffix)
        }
    }

    func validatePassword(_ password: String?) throws {
        guard let password = password,
            !password.trimmed.isEmpty else {
            throw PasswordError.empty
        }

        if password.count < 8 || password.count > 20 {
            throw PasswordError.invalid(reason: .length)
        }

        if !password.validateRegex(.password) {
            throw PasswordError.invalid(reason: .format)
        }
    }

    func login(username: String?, password: String?, completion: ((CompletionResult) -> Void)?) throws {
        try validateUsername(username)
        try validatePassword(password)
        guard let username = username, !username.isEmpty,
            let password = password, !password.isEmpty else { return }
        entity?.login(username: username, password: password, completion: completion)
    }
}

// MARK: - Error definitions and reason

enum UsernameError: Error {
    case empty
    case invalid(reason: UsernameErrorReason)

    var localizedDescription: String {
        switch self {
        case .empty:
            return "Username is required"
        case .invalid(let reason):
            return reason.rawValue
        }
    }
}

enum PasswordError: Error {
    case empty
    case invalid(reason: PasswordErrorReason)

    var localizedDescription: String {
        switch self {
        case .empty:
            return "Password is required"
        case .invalid(let reason):
            return reason.rawValue
        }
    }
}

enum PasswordErrorReason: String {
    case length = "Password's length must be greater than 7 and less than 21"
    case format = "A password can only contain alphanumeric characters with underscores, hyphens, periods, at sign"
}

enum UsernameErrorReason: String {
    case length = "Password's length must be greater than 7 and less than 21"
    case format = "Username must be a valid email address"
    case suffix = "Username must has suffix @gmail.com"
}
