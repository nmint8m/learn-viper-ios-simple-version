//
//  CategoryLocalDB.swift
//  DemoViper
//
//  Created by Tam Nguyen M. on 1/22/19.
//  Copyright © 2019 Tam Nguyen M. All rights reserved.
//

import Foundation

// MARK: - CategoryEntityProtocol
final class CategoryLocalDB: CategoryEntityProtocol {
    func getAllCategories(completion: Completion?) {
        let pop = CategoryModel(id: 0, name: "Pop", description: "Popular music")
        let rock = CategoryModel(id: 1, name: "Rock", description: "Rock music")
        let rap = CategoryModel(id: 0, name: "Rap", description: "Rap music")
        let categories = [pop, rock, rap]
        completion?(.success(categories))
    }

    func getDetailCategories(completion: Completion?) {
        completion?(.success(true))
    }
}
