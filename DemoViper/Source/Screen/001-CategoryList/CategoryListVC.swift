//
//  CategoryListVC.swift
//  DemoViper
//
//  Created by Tam Nguyen M. on 1/22/19.
//  Copyright © 2019 Tam Nguyen M. All rights reserved.
//

import UIKit

protocol CategoryListViewProtocol: class {
    var handler: CategoryListHandler? { get set }

    func reloadCategoryList()
}

protocol CategoryListHandler {
    // Datasource
    func getNumberOfCategories() -> Int
    func getCategory(at index: Int) -> CategoryModel?

    // Delegate
    func getAllCategories()
    func showCategoryDetail(at index: Int)
}

final class CategoryListVC: UIViewController, CategoryListViewProtocol {

    // MARK: - Properties

    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavitionBar()
        configTableView()
        handler?.getAllCategories()
    }

    // MARK: - Private func
    private func configNavitionBar() {
        title = "Category List"
    }

    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 50
    }

    // MARK: - CategoryListViewProtocol
    var handler: CategoryListHandler?

    func reloadCategoryList() {
        let count: Int = handler?.getNumberOfCategories() ?? 0
        tableView.isHidden = count == 0
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension CategoryListVC: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return handler?.getNumberOfCategories() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        guard let category = handler?.getCategory(at: indexPath.row) else {
            return cell
        }
        cell.textLabel?.text = category.name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        handler?.showCategoryDetail(at: indexPath.row)
    }
}
