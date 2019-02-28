//
//  Router.swift
//  DemoViper
//
//  Created by Tam Nguyen M. on 1/13/19.
//  Copyright © 2019 Tam Nguyen M. All rights reserved.
//

import UIKit

protocol Router {
    associatedtype View: UIViewController

    /// The root view controller of this router
    var rootVC: View? { get set } // Please always set weak for this property

    /// Show error on this router's root view controller
    ///
    /// - Parameter error: The error is needed to show
    func showError(_ error: Error)
}

extension Router {
    func showError(_ error: Error) {
        let alert = UIAlertController(title: "ERROR", message: error.localizedDescription, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(ok)
        rootVC?.present(alert, animated: true, completion: nil)
    }
}
