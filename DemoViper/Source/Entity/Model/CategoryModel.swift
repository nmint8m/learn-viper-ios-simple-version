//
//  CategoryModel.swift
//  DemoViper
//
//  Created by Tam Nguyen M. on 2/26/19.
//  Copyright © 2019 Tam Nguyen M. All rights reserved.
//

import Foundation

final class CategoryModel {
    var id = 0
    var name = ""
    var description = ""

    init(id: Int = 0, name: String = "", description: String = "") {
        self.id = id
        self.name = name
        self.description = description
    }
}
