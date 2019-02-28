//
//  CategoryListPresenter.swift
//  DemoViper
//
//  Created by Tam Nguyen M. on 1/22/19.
//  Copyright © 2019 Tam Nguyen M. All rights reserved.
//

import Foundation

// MARK: - CategoryListPresenterProtocol
protocol CategoryListPresenterProtocol: CategoryListHandler {
    var view: CategoryListViewProtocol? { get set }
    var router: CategoryListRouter? { get set }
    var interactor: CategoryListInteractorProtocol? { get set }
}

// MARK: - CategoryListPresenter
final class CategoryListPresenter: CategoryListPresenterProtocol {

    // MARK: - Private properties
    private var categories: [CategoryModel] = []

    // MARK: - CategoryListPresenterProtocol
    weak var view: CategoryListViewProtocol?
    var router: CategoryListRouter?
    var interactor: CategoryListInteractorProtocol?
}

// MARK: - CategoryListHandler
extension CategoryListPresenter {
    func getNumberOfCategories() -> Int {
        return categories.count
    }

    func getCategory(at index: Int) -> CategoryModel? {
        guard index < categories.count else { return nil }
        return categories[index]
    }

    func getAllCategories() {
        interactor?.getAllCategories { [weak self] result in
            guard let this = self,
                let view = this.view else { return }

            if case .success(let c) = result,
                let categories = c as? [CategoryModel]  {
                this.categories = categories
            }
            view.reloadCategoryList()
        }
    }

    func showCategoryDetail(at index: Int) {
        guard let category = getCategory(at: index) else { return }
        router?.showScreen(type: .categoryDetail(category))
    }
}
