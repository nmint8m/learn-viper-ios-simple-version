//
//  CategoryEntityProtocol.swift
//  DemoViper
//
//  Created by Tam Nguyen M. on 1/22/19.
//  Copyright © 2019 Tam Nguyen M. All rights reserved.
//

import Foundation

protocol CategoryEntityProtocol {
    func getAllCategories(completion: Completion?)
    func getDetailCategories(completion: Completion?)
}
