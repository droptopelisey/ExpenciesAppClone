//
//  DetailsViewController.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 06.12.2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    
    var transactionModel: TransactionModel?
    var removeClosure: (() -> Void)?
    
    // MARK: Constants
    
    enum Constants {
        static let modelCount: Int = 4
    }
    
    
    // MARK: Subviews
    
    private lazy var moneyLabel = {
        let label = UILabel(frame: .zero)
        label.text = "\(String(describing: transactionModel?.amount ?? 0))" 
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tableview = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
        view.backgroundColor = .systemBackground
        navigationItem.largeTitleDisplayMode = .never
        setupTrashButton()
        addSubViews()
        setupTableView()
    }

    // MARK: Setups
    
    private func setupTrashButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "trash"), style: .plain, target: self, action: #selector(removeCurrentRecord))
    }
    
    @objc
    private func removeCurrentRecord() {
        let alert = UIAlertController(
            title: "Удалить",
            message: "Вы уверены что хотите удалить? Восстановить будет невозможно",
            preferredStyle: .alert
        )
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {_ in 
            
        }
        let removeAction = UIAlertAction(title: "Remove", style: .destructive) { [ weak self ] _ in
            self?.transactionModel = nil
            self?.removeClosure?()
            self?.navigationController?.popViewController(animated: true)
        }
        alert.addAction(cancelAction)
        alert.addAction(removeAction)
        present(alert, animated: true)

    }
    
    private func addSubViews() {
        view.addSubview(moneyLabel)
        view.addSubview(tableview)
        
        NSLayoutConstraint.activate([
            moneyLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            moneyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableview.topAnchor.constraint(equalTo: moneyLabel.bottomAnchor, constant: 20),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
            

        ])
    }
    
    private func setupTableView() {
        view.addSubview(tableview)
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(DetailsCell.self, forCellReuseIdentifier: DetailsCell.identifier)
        
        NSLayoutConstraint.activate([
        tableview.topAnchor.constraint(equalTo: moneyLabel.bottomAnchor, constant: 20),
        tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        tableview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
    ])
    }
}


extension DetailsViewController: UITableViewDelegate {
    
}

extension DetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Constants.modelCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailsCell.identifier, for: indexPath) as? DetailsCell
        switch indexPath.row {
        case 0:
             cell?.setup(title: "Title" , meaning: transactionModel?.title)
        case 1:
            cell?.setup(title: "Date" , meaning: transactionModel?.dateString)
        case 2:
            cell?.setup(title: "Category" , meaning: transactionModel?.category.title)
        case 3:
            cell?.setup(title: "Note" , meaning: transactionModel?.note)
        default:
            break
        }
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}
