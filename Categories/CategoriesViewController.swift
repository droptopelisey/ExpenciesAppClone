//
//  CategoriesViewController.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 06.01.2024.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    var categoryClouser: ((Category) -> Void)?
    
    enum Sections: Int, CaseIterable {
        case first
        case second
        case third
        case fourth
        case fifth
        case sixth
        case seventh
        case eighth
        case ninth
        
        var title: String {
            switch self {
            case .first:
                "Auto & Transport"
            case .second:
                "Bills & Utilites"
            case .third:
                "Entertainment"
            case .fourth:
                "Fees & Charges"
            case .fifth:
                "Food & Dining"
            case .sixth:
                "Home"
            case .seventh:
                "Income"
            case .eighth:
                "Shopping"
            case .ninth:
                "Transfer"
            }
        }
        
        var picture: String {
            switch self {
            case .first:
                "car"
            case .second:
                "list.clipboard"
            case .third:
                "film"
            case .fourth:
                "creditcard.and.123"
            case .fifth:
                "cart"
            case .sixth:
                "house"
            case .seventh:
                "dollarsign"
            case .eighth:
                "giftcard"
            case .ninth:
                "arrow.left.arrow.right"
            }
        }
    }
    
    
    let categories: [Category] = CategoriesStore.shared.getData()
    
    
    // MARK: SubView TableView
    private lazy var tableView = {
        let table = UITableView(frame: .zero)
        table.backgroundColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "bgColor")
        title = "Settings"
        setupTableView()
    }
    
    // MARK: Setups
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CategoriesViewCell.self, forCellReuseIdentifier: CategoriesViewCell.identifier)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    
    func loadCategories() {
        
    }
 
}


extension CategoriesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
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
            return 2
        case .second:
            return 1
        case .third:
            return 1
        case .fourth:
            return 2
        case .fifth:
            return 2
        case .sixth:
            return 2
        case .seventh:
            return 1
        case .eighth:
            return 1
        case .ninth:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return simpleCell(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard
            let section = Sections(rawValue: section)
        else {
            fatalError()
        }
        return section.title
    }
}

extension CategoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            categoryClouser?(categories[indexPath.section + indexPath.row])
        } else if indexPath.section == 1 || indexPath.section == 2 {
            categoryClouser?(categories[indexPath.section + indexPath.row + 1])
        } else if indexPath.section == 3 {
            categoryClouser?(categories[indexPath.section + indexPath.row + 1])
        } else if indexPath.section == 4 {
            categoryClouser?(categories[indexPath.section + indexPath.row + 2])
        } else if indexPath.section == 5 {
            categoryClouser?(categories[indexPath.section + indexPath.row + 3])
        } else if indexPath.section == 6 {
            categoryClouser?(categories[indexPath.section + indexPath.row + 4])
        } else  if indexPath.section == 7 {
            categoryClouser?(categories[indexPath.section + indexPath.row + 5])
        } else if indexPath.section == 8 {
            categoryClouser?(categories[indexPath.section + indexPath.row + 3])
        }
        
        dismiss(animated: true)
        
    }
   
}

extension CategoriesViewController {
    
    func simpleCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesViewCell.identifier, for: indexPath) as? CategoriesViewCell
    else {
        return UITableViewCell()
    }
        cell.separatorInset = UIEdgeInsets(
            top: 0,
            left: 70,
            bottom: 0,
            right: 0
        )
      
        if indexPath.section == 0 {
            cell.setupLabel(title: categories[indexPath.section + indexPath.row].title)
        } else if indexPath.section == 1 || indexPath.section == 2 {
            cell.setupLabel(title: categories[indexPath.section + indexPath.row + 1].title)
        } else if indexPath.section == 3 {
            cell.setupLabel(title: categories[indexPath.section + indexPath.row + 1].title)
        } else if indexPath.section == 4 {
            cell.setupLabel(title: categories[indexPath.section + indexPath.row + 2].title)
        } else if indexPath.section == 5 {
            cell.setupLabel(title: categories[indexPath.section + indexPath.row + 3].title)
        } else if indexPath.section == 6 {
            cell.setupLabel(title: categories[indexPath.section + indexPath.row + 4].title)
        } else  if indexPath.section == 7 {
            cell.setupLabel(title: categories[indexPath.section + indexPath.row + 5].title)
        } else if indexPath.section == 8 {
            cell.setupLabel(title: categories[indexPath.section + indexPath.row + 3].title)
        }
        
        if indexPath.section == 0 {
            cell.setupPicture(name: categories[indexPath.section + indexPath.row].picture)
        } else if indexPath.section == 1 || indexPath.section == 2 {
            cell.setupPicture(name: categories[indexPath.section + indexPath.row + 1].picture)
        } else if indexPath.section == 3 {
            cell.setupPicture(name: categories[indexPath.section + indexPath.row + 1].picture)
        } else if indexPath.section == 4 {
            cell.setupPicture(name: categories[indexPath.section + indexPath.row + 2].picture)
        } else if indexPath.section == 5 {
            cell.setupPicture(name: categories[indexPath.section + indexPath.row + 3].picture)
        } else if indexPath.section == 6 {
            cell.setupPicture(name: categories[indexPath.section + indexPath.row + 4].picture)
        } else  if indexPath.section == 7 {
            cell.setupPicture(name: categories[indexPath.section + indexPath.row + 5].picture)
        } else if indexPath.section == 8 {
            cell.setupPicture(name: categories[indexPath.section + indexPath.row + 3].picture)
        }
       
        
               
        return cell
    }
}
