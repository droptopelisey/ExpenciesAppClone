//
//  ViewController.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 04.12.2023.
//

import UIKit

class DashboardViewController: UIViewController {
    
   
    
    // MARK: SubView TableView
    private lazy var tableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    // MARK: SubViewButton
    private lazy var circleButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = 25
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(circleButtonAction), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: Sections
    private enum Sections: Int, CaseIterable {
        case info
        case recent
    }
    
    // MARK: Constants
    private enum Constants {
        static let infoCellHeight: CGFloat = 180.0
        static let historyCellHeight: CGFloat = 90.0
    }
    
    // MARK: Properties
    private var viewModel: DashboardViewModelProtocol

    
    // MARK: Life Cycle
    
    init(viewModel: DashboardViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "bgColor")
        title = "Dashboard"
        bind()
        setupTableView()
        
        viewModel.getData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupGradient()
    }
    
    
    // MARK: Bind
    private func bind() {
        viewModel.callback = { [ weak self ] in
            self?.tableView.reloadData()
        }
    }


    // MARK: Setups
    
    private func setupGradient() {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = circleButton.bounds
        gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        gradient.locations = [0.0, 1.0]
        circleButton.layer.insertSublayer(gradient, at: 0)
        gradient.cornerRadius = 25
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        view.addSubview(circleButton)
        tableView.register(InfoCell.self, forCellReuseIdentifier: InfoCell.identifier)
        tableView.register(RecentCell.self, forCellReuseIdentifier: RecentCell.identifier)
        
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            circleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            circleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            circleButton.heightAnchor.constraint(equalToConstant: 50),
            circleButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc
    func circleButtonAction() {
        let vc = AddTransactionViewController(viewModel: AddTransactionViewModel())
        vc.saveButtonClickedClouser = { [weak self] in
            self?.viewModel.getData()
            self?.tableView.reloadData()
        }
        present(vc, animated: true)
    }
    
}


extension DashboardViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard
            let sectionName = Sections(rawValue: indexPath.section)
        else {
            fatalError()
        }
        switch sectionName {
        case.info:
            return Constants.infoCellHeight
        case.recent:
            return Constants.historyCellHeight
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = DetailsViewController()
        detailsVC.transactionModel = viewModel.data[indexPath.row]
        detailsVC.removeClosure = { [weak self ] in
            self?.viewModel.removeData(at: indexPath.row)
        }
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

extension DashboardViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        Sections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard
            let sectionName = Sections(rawValue: section)
        else {
            fatalError()
        }
        switch sectionName {
            
        case .info:
            return 1
        case .recent:
            return viewModel.data.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let sectionName = Sections(rawValue: indexPath.section)
        else {
            fatalError()
        }
        switch sectionName {
            
        case .info:
            return firstSectionCell(tableView, cellForRowAt: indexPath)
        case .recent:
            return secondSectionCell(tableView, cellForRowAt: indexPath)
        }
        
    }
}
    
    extension DashboardViewController {
        
        private func firstSectionCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: InfoCell.identifier, for: indexPath) as? InfoCell
            else {
                return UITableViewCell()
            }
            let moneyData = viewModel.getBalance()
            cell.setupLabels(balance: moneyData.amount, expence: moneyData.expence, income: moneyData.income)
            return cell
        }
        
        private func secondSectionCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: RecentCell.identifier, for: indexPath) as? RecentCell
            else {
                return UITableViewCell()
            }
            cell.setupModel(transaction: viewModel.data[indexPath.row])
            
            cell.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
            return cell
        }
    }

