//
//  String.swift
//  DemoViper
//
//  Created by Tam Nguyen M. on 1/17/19.
//  Copyright © 2019 Tam Nguyen M. All rights reserved.
//

import Foundation

extension String {

    var trimmed: String {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    func validateRegex(_ regex: Regex) -> Bool {
        let pre = NSPredicate(format: "SELF MATCHES %@", regex.rawValue)
        return pre.evaluate(with: self)
    }
}
