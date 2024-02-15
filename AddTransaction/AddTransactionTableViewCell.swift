//
//  AddTransactionTableViewCell.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 30.12.2023.
//

import UIKit

class AddTransactionTableViewCell: UITableViewCell {
    // MARK: Subviews
    
    lazy var summText = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "Сумма"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // MARK: Life Cycle
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubViews()
    }
        
    required init?(coder: NSCoder) {
            super.init(coder: coder)
        setupSubViews()
    }
    
    // MARK: Setups
    
    private func setupSubViews() {
        contentView.addSubview(summText)
        
        NSLayoutConstraint.activate([
            summText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            summText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            summText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            summText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            summText.heightAnchor.constraint(equalToConstant: 24),
        ])
        
    }
    
    func setup(name: String) {
        summText.placeholder = name
    }

}
