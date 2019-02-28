//
//  UserLocalDB.swift
//  DemoViper
//
//  Created by Tam Nguyen M. on 1/17/19.
//  Copyright © 2019 Tam Nguyen M. All rights reserved.
//

import Foundation
import Alamofire

final class UserLocalDB: UserEntityProtocol {

    func login(username: String, password: String, completion: ((CompletionResult) -> Void)?) {
        guard username == "nmint8m@gmail.com" && password == "123456789" else {
            completion?(.failure(NSError(domain: "", code: 999, userInfo: nil)))
            return
        }
        completion?(.success)
    }
}
