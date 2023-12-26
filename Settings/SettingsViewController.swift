//
//  SettingsViewController.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 04.12.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    enum Sections: Int, CaseIterable {
        case first
        case second
        case third
        case fourth
    }
    
// MARK: SubView TableView
    private lazy var tableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.backgroundColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
// MARK: Properties
    private var viewModel: SettingsViewModelProtocol
    
    
// MARK: Life Cycle
    
    init(viewModel: SettingsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "bgColor")
        title = "Settings"
        bind()
        setupTableView()
    }
    
// MARK: Bind
    private func bind() {
        viewModel.callback = {
            
        }
    }
    
// MARK: Setups
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.register(FirstSectionSettingsCell.self, forCellReuseIdentifier: FirstSectionSettingsCell.identifier)
        tableView.register(SecondSectionCell.self, forCellReuseIdentifier: SecondSectionCell.identifier)
        tableView.register(ThirdSectionCell.self, forCellReuseIdentifier: ThirdSectionCell.identifier)
        tableView.register(FourthSectionCell.self, forCellReuseIdentifier: FourthSectionCell.identifier)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    
    
}
    



extension SettingsViewController: UITableViewDelegate {
    
}


extension SettingsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        Sections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Sections(rawValue: section) {
        case .first:
            1
        case .second:
            2
        case .third:
            2
        case .fourth:
            4
        case .none:
            0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        let section = Sections(rawValue: indexPath.section)
        switch section {
            case .first:
            cell = tableView.dequeueReusableCell(withIdentifier: FirstSectionSettingsCell.identifier, for: indexPath)
            (cell as? FirstSectionSettingsCell)?.setup(model: viewModel.getModel(for: .first, with: indexPath.section + indexPath.row))
        case .second:
            cell = tableView.dequeueReusableCell(withIdentifier: SecondSectionCell.identifier, for: indexPath)
            (cell as? SecondSectionCell)?.setup(model: viewModel.getModel(for: .second, with: indexPath.section + indexPath.row))
        case .third:
            cell = tableView.dequeueReusableCell(withIdentifier: ThirdSectionCell.identifier, for: indexPath)
            (cell as? ThirdSectionCell)?.setup(viewModel: viewModel.getModel(for: .third, with: indexPath.section + indexPath.row + 1))
        case .fourth:
            cell = tableView.dequeueReusableCell(withIdentifier: FourthSectionCell.identifier, for: indexPath)
            (cell as? FourthSectionCell)?.setup(viewModel: viewModel.getModel(for: .fourth, with: indexPath.section + indexPath.row + 2))
        case .none:
            cell = UITableViewCell()
        }
        
      
        cell.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch Sections(rawValue: indexPath.section) {
        case .first:
            120
        case .second, .third, .fourth:
            44
        case .none:
            0
        }
    }
}
