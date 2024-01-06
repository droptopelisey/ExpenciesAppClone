//
//  CategoriesViewController.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 06.01.2024.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    // MARK: SubView TableView
    private lazy var tableView = {
        let table = UITableView(frame: .zero)
        table.backgroundColor = .green
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        9
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    
}

extension CategoriesViewController: UITableViewDelegate {
    
   
}
