//
//  CategoryRouter.swift
//  DemoViper
//
//  Created by Tam Nguyen M. on 1/22/19.
//  Copyright © 2019 Tam Nguyen M. All rights reserved.
//

import UIKit

final class CategoryListRouter: Router {

    var rootVC: UIViewController?

    func showScreen(type: ScreenType) {
        switch type {
        case .categoryDetail(let category):
            let vc = categoryDetailVC(category)
            rootVC?.navigationController?.pushViewController(vc, animated: true)
        }
    }

    func categoryDetailVC(_ category: CategoryModel) -> CategoryDetailVC {
        let presenter = CategoryDetailPresenter(category: category)

        let vc = CategoryDetailVC()
        vc.handler = presenter

        let router = CategoryDetailRouter()
        router.rootVC = vc

        let entity = CategoryLocalDB()

        let interactor = CategoryDetailInteractor()
        interactor.entity = entity

        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router

        return vc
    }
}

extension CategoryListRouter {
    enum ScreenType {
        case categoryDetail(CategoryModel)
    }
}
