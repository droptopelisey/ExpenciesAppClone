//
//  HistoryViewController.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 04.12.2023.
//

import UIKit

class HistoryViewController: UIViewController {
    
// MARK: SubView TableView
    private lazy var tableView = {
        let table = UITableView(frame: .zero)
        table.backgroundColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
// MARK: Properties
    private var viewModel: HistoryViewModelProtocol
    
    private let searchController = UISearchController(searchResultsController: nil)
    
// MARK: Life Cycle
    init(viewModel: HistoryViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "bgColor")
        title = "History"
        viewModel.getTransactions()
        setupTableView()
        setupSearchController()
    }
    
// MARK: Bind
    private func bind() {
        viewModel.callback = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    
// MARK: Setups
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.register(HistoryCell.self, forCellReuseIdentifier: HistoryCell.identifier)
        
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 45),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
}

extension HistoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: HistoryCell.identifier, for: indexPath) as? HistoryCell
        else {
            return UITableViewCell()
        }
        cell.setupModel(transaction: viewModel.transactions[indexPath.row])
        return cell
    }
    
    
}

extension HistoryViewController: UITableViewDelegate {
    
}


extension HistoryViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
//        filtredNumbers = numbersArray.filter { number in
//            guard let searchText = searchController.searchBar.text?.lowercased() else { return false }
//            let numberInString = String(number).lowercased()
//            return numberInString.contains(searchText)
//        }
        tableView.reloadData()
    }
    
}
