//
//  LoginRouter
//  DemoViper
//
//  Created by Tam Nguyen M. on 1/17/19.
//  Copyright © 2019 Tam Nguyen M. All rights reserved.
//

import UIKit

final class LoginRouter: Router {

    var rootVC: UIViewController?

    func showScreen(type: ScreenType) {
        switch type {
        case .categoryModule:
            changeAppDelegateRootViewController()
        }
    }

    func changeAppDelegateRootViewController() {
        AppDelegate.shared.router?.configRootVC(screenType: .categoryModule)
        AppDelegate.shared.window?.rootViewController = AppDelegate.shared.router?.rootVC
    }
}

extension LoginRouter {
    enum ScreenType {
        case categoryModule
    }
}
