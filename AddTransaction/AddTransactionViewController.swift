//
//  AddTransactionViewController.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 30.12.2023.
//

import UIKit

class AddTransactionViewController: UIViewController {
    
    var saveButtonClickedClouser: (() -> Void)?
    
    
    var enteredCategory: CategoryModel = CategoryModel(picture: "car", title: "cars")
    
    enum Sections: Int, CaseIterable {
        case first
        case second
        case third
    }
    
    // MARK: TableView
    
    private lazy var tableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.backgroundColor = UIColor(named: "bgColor")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    // MARK: SubViews
    
    private lazy var xButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(dismisScreen), for: .touchUpInside)
        return button
    }()
    
    private lazy var mainLabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Main Label"
        return label
    }()
    
    private lazy var saveButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "checkmark"), for: .normal)
        button.addTarget(self, action: #selector(saved), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var segments = {
        let segment = UISegmentedControl(items: ["Расходы", "Доходы"])
        segment.selectedSegmentIndex = 0
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    private lazy var firstBigSectionView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    
    // MARK: Properties
    
    private var viewModel: AddTransactionModelProtocol
    
    
    // MARK: Life Cycle
    
    init(viewModel: AddTransactionModelProtocol) {
        self.viewModel = viewModel
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Добавьте транзакцию"
        view.backgroundColor = UIColor(named: "bgColor")
        setupTableView()
        setupTopLine()
    }
    
// MARK: Setups
    
    private func setupTableView() {
       
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(AddTransactionTableViewCell.self, forCellReuseIdentifier: AddTransactionTableViewCell.identifier)
        tableView.register(DateTableViewCell.self, forCellReuseIdentifier: DateTableViewCell.identifier)
        tableView.register(AddCategoryTableViewCell.self, forCellReuseIdentifier: AddCategoryTableViewCell.identifier)
        
       
    }
    
    private func setupTopLine() {
        view.addSubview(xButton)
        view.addSubview(mainLabel)
        view.addSubview(saveButton)
        view.addSubview(segments)
        view.addSubview(tableView)
        
        
        NSLayoutConstraint.activate([
            xButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            xButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            saveButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            
            
            segments.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            segments.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            segments.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 20),
            
            tableView.topAnchor.constraint(equalTo: segments.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
    
    
    @objc
    func dismisScreen() {
        dismiss(animated: true)
    }
    
    @objc
    func saved() {
        
        guard
            let firstCell = tableView.cellForRow(at: IndexPath(row: 0, section: Sections.first.rawValue)) as? AddTransactionTableViewCell,
            let secondCell = tableView.cellForRow(at: IndexPath(row: 1, section: Sections.first.rawValue)) as? AddTransactionTableViewCell,
            let thirdCell = tableView.cellForRow(at: IndexPath(row: 2, section: Sections.first.rawValue)) as? DateTableViewCell,
            let fifthhCell = tableView.cellForRow(at: IndexPath(row: 0, section: Sections.third.rawValue)) as? AddTransactionTableViewCell

        else {
            return
        }
        viewModel.save(
            model: TransactionModel(
                title: secondCell.summText.text ?? "",
                amount: Double(firstCell.summText.text ?? "") ?? 0.0,
                category: enteredCategory,
                date: thirdCell.datePik.date,
                note: fifthhCell.summText.text ?? "",
                expenceIncome: segments.selectedSegmentIndex == 0
            )
        )
        saveButtonClickedClouser?()
        dismiss(animated: true)
    }
}


extension AddTransactionViewController: UITableViewDataSource {
    
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
        case .first:
            return 3
        case .second:
            return 1
        case .third:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let section = Sections(rawValue: indexPath.section)
        else {
           return UITableViewCell()
        }
        
        switch section {
        case .first:
            if indexPath.row == 0 {
                
               return firstSectionCell(tableView, cellForRowAt: indexPath, name: "Сумма")
                
            } else if indexPath.row == 1 {
                
                return firstSectionCell(tableView, cellForRowAt: indexPath, name: "Название")
                 
             }
            else if indexPath.row == 2 {
               return secondSectionCell(tableView, cellForRowAt: indexPath)
            }
            else {
                return UITableViewCell()
            }
        case .second:
            return thirdSectionCell(tableView, cellForRowAt: indexPath)
        case .third:
            return firstSectionCell(tableView, cellForRowAt: indexPath, name: "Заметка")
        }
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard
            let section = Sections(rawValue: section)
        else {
           return " "
        }
        
        switch section {
        case .first:
           return "Информация"
        case .second:
            return ""
        case .third:
            return "Заметка"
        }
    }
    
}

extension AddTransactionViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let categoriesVC = CategoriesViewController()
        categoriesVC.categoryClouser = { [weak self] category in
            (tableView.cellForRow(
                    at: IndexPath(
                        row: 0,
                        section: Sections.second.rawValue
                    )
                ) as? AddCategoryTableViewCell
            )?.setup(
                picture: category.picture,
                title: category.title
            )
            self?.enteredCategory = category
        }
        present(categoriesVC, animated: true, completion: nil)
//        navigationController?.pushViewController(categoriesVC, animated: true)
    }
}


extension AddTransactionViewController {
    
    private func firstSectionCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, name: String) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: AddTransactionTableViewCell.identifier, for: indexPath) as? AddTransactionTableViewCell
        else {
            return UITableViewCell()
        }
        cell.setup(name: name)
        cell.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        return cell
    }
    
    private func secondSectionCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: DateTableViewCell.identifier, for: indexPath) as? DateTableViewCell
        else {
            return UITableViewCell()
        }
        return cell
        
    }
    
    private func thirdSectionCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: AddCategoryTableViewCell.identifier, for: indexPath) as? AddCategoryTableViewCell
        else {
            return UITableViewCell()
        }
        return cell
        
    }
}
