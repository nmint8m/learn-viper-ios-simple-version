//
//  RootRouter.swift
//  DemoViper
//
//  Created by Tam Nguyen M. on 1/13/19.
//  Copyright © 2019 Tam Nguyen M. All rights reserved.
//

import UIKit

/// Router of AppDelegate
final class RootRouter: Router {

    /// Root view controller of application
    var rootVC: UIViewController?

    init(screenType: ScreenType = .loginModule) {
        configRootVC(screenType: screenType)
    }

    func configRootVC(screenType: ScreenType) {
        switch screenType {
        case .loginModule:
            rootVC = loginModule
        case .categoryModule:
            rootVC = categoryModule
        }
    }

    var loginModule: LoginVC {
        let presenter = LoginPresenter()
        
        let vc = LoginVC()
        vc.handler = presenter

        let router = LoginRouter()
        router.rootVC = vc

        let interactor = LoginInteractor()
        interactor.entity = UserLocalDB()

        presenter.view = vc
        presenter.router = router
        presenter.interactor = interactor

        return vc
    }

    var categoryModule: UINavigationController {
        let presenter = CategoryListPresenter()

        let vc = CategoryListVC()
        vc.handler = presenter
 
        let router = CategoryListRouter()
        router.rootVC = vc

        let entity = CategoryLocalDB()

        let interactor = CategoryListInteractor()
        interactor.entity = entity

        presenter.view = vc
        presenter.router = router
        presenter.interactor = interactor

        let navi = UINavigationController(rootViewController: vc)
        return navi
    }
}

extension RootRouter {
    enum ScreenType {
        case loginModule
        case categoryModule
    }
}
