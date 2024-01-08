//
//  CategoriesViewController.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 06.01.2024.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    let categorySectionsData: [String:[String]] = [
        "Auto & Transport":["Public Transportation", "Taxi"], "Bills & Utilites":["Mobile Phone"], "Entertainment":["Movies & DVDs"], "Fees & Charges":["Bank Fee", "Finance Charge"], "Food & Dining":["Groceries", "Restaurants"], "Home":["Rent", "Home Supplies"], "Income":["Paycheque"], "Shopping":["Software"], "Transfer":["Credit Card Payment"]
    ]
    
    let categoriesPictures: [String:[String]] = ["car":["bus.fill", "car.front.waves.up"] ]
    
    // MARK: SubView TableView
    private lazy var tableView = {
        let table = UITableView(frame: .zero)
        table.backgroundColor = UIColor(named: "bgColor")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupTableView()
    }
    
    // MARK: Setups
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CategoriesViewCell.self, forCellReuseIdentifier: CategoriesViewCell.identifier)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
 
}


extension CategoriesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        categorySectionsData.keys.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let sortedKeys = categorySectionsData.keys.sorted()
//        let sectionKey = sortedKeys[section]
//        return categorySectionsData[sectionKey]?.count ?? 0
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return simpleCell(tableView, cellForRowAt: indexPath)
    }
}

extension CategoriesViewController: UITableViewDelegate {
    
   
}

extension CategoriesViewController {
    
    func simpleCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesViewCell.identifier, for: indexPath) as? CategoriesViewCell
    else {
        return UITableViewCell()
    }
        let sectionKey = Array(categorySectionsData.keys)[indexPath.section]
//        let categoryArray = categorySectionsData[sectionKey]
//        let category = categoryArray?[indexPath.row] ?? ""
                
    cell.setupPicturesAndLabels(title: sectionKey, pitureName: "car")
                
    cell.separatorInset = UIEdgeInsets(top: 0, left: 70, bottom: 0, right: 0)
//    cell.setupPicturesAndLabels(title: titleLabel, pitureName: pictureName)
    cell.separatorInset = UIEdgeInsets(top: 0, left: 70, bottom: 0, right: 0)
    return cell
}
}
