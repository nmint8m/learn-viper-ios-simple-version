//
//  UserEntityProtocol.swift
//  DemoViper
//
//  Created by Tam Nguyen M. on 1/22/19.
//  Copyright © 2019 Tam Nguyen M. All rights reserved.
//

import Foundation

protocol UserEntityProtocol {
    func login(username: String, password: String,
               completion: ((CompletionResult) -> Void)?)
}
