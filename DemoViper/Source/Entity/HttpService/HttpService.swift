//
//  HttpService.swift
//  DemoViper
//
//  Created by Tam Nguyen M. on 1/17/19.
//  Copyright © 2019 Tam Nguyen M. All rights reserved.
//

import Foundation
import Alamofire

typealias JSObject = [String: Any]
typealias JSArray = [JSObject]

typealias Completion = (Result<Any>) -> Void

enum CompletionResult {
    case success
    case failure(Error)
}


