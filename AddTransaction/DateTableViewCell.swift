//
//  DateTableViewCell.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 02.01.2024.
//

import UIKit

class DateTableViewCell: UITableViewCell {
    
    
// MARK: Subviews
    
    private lazy var nameLabel = {
        let label = UILabel(frame: .zero)
        label.text = "Дата"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private(set) lazy var datePik = {
        let piker = UIDatePicker(frame: .zero)
        piker.translatesAutoresizingMaskIntoConstraints = false
        return piker
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
            addSubview(nameLabel)
            addSubview(datePik)
            
            NSLayoutConstraint.activate([
                nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
                
                datePik.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                datePik.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                datePik.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12)
                
            ])
        }

}
