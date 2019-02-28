//
//  CategoryDetailPresenter.swift
//  DemoViper
//
//  Created by Tam Nguyen M. on 2/26/19.
//  Copyright © 2019 Tam Nguyen M. All rights reserved.
//

import Foundation

// MARK: - CategoryDetailPresenterProtocol
protocol CategoryDetailPresenterProtocol: CategoryDetailViewHandler {
    var view: CategoryDetailViewProtocol? { get set }
    var router: CategoryDetailRouter? { get set }
    var interactor: CategoryDetailInteractorProtocol? { get set }

    init(category: CategoryModel)
}

// MARK: - CategoryDetailPresenter
final class CategoryDetailPresenter: CategoryDetailPresenterProtocol {

    // MARK: - Private properties
    private var category = CategoryModel()

    // MARK: - CategoryDetailPresenterProtocol
    weak var view: CategoryDetailViewProtocol?
    var router: CategoryDetailRouter?
    var interactor: CategoryDetailInteractorProtocol?

    init(category: CategoryModel){
        self.category = category
    }
}

// MARK: - CategoryDetailViewHandler
extension CategoryDetailPresenter {
    func getCategoryName() -> String {
        return category.name
    }
}
