//
//  CategoryDetailInteractor.swift
//  DemoViper
//
//  Created by Tam Nguyen M. on 2/26/19.
//  Copyright © 2019 Tam Nguyen M. All rights reserved.
//

import Foundation

protocol CategoryDetailInteractorProtocol {
    var entity: CategoryEntityProtocol? { get set }
}

final class CategoryDetailInteractor: CategoryDetailInteractorProtocol {
    var entity: CategoryEntityProtocol?
}
