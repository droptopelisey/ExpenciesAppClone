//
//  HistoryCell.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 04.12.2023.
//

import UIKit

// Настроить поиск


class HistoryCell: UITableViewCell {
// MARK: SubViews
    private lazy var cellView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var firstLabel = {
        let label = UILabel(frame: .zero)
        label.text = "Products"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var secondLabel = {
        let label = UILabel(frame: .zero)
        label.text = "Groceries"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var thirdLabel = {
        let label = UILabel(frame: .zero)
        label.text = "30/10/2023"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var amountMoneyLabel = {
        let label = UILabel(frame: .zero)
        label.text = "- $255"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var pictureView = {
        let image = UIImageView(image: UIImage(systemName: "basket.fill"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: Life Cycle
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupCellView()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupCellView()
        }
    
    // MARK: Setups
    
    private func setupCellView() {
        addSubview(cellView)
        cellView.layer.cornerRadius = 10
        backgroundColor = .clear
        
        cellView.addSubview(firstLabel)
        cellView.addSubview(secondLabel)
        cellView.addSubview(thirdLabel)
        cellView.addSubview(amountMoneyLabel)
        cellView.addSubview(pictureView)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            firstLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 3),
            firstLabel.leadingAnchor.constraint(equalTo: pictureView.leadingAnchor, constant: 55),
            
            secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 3),
            secondLabel.leadingAnchor.constraint(equalTo: pictureView.leadingAnchor, constant: 55),
            
            thirdLabel.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 3),
            thirdLabel.leadingAnchor.constraint(equalTo: pictureView.leadingAnchor, constant: 55),
            
            amountMoneyLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            amountMoneyLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -15),
            
            pictureView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 24),
            pictureView.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            pictureView.heightAnchor.constraint(equalToConstant: 28),
            pictureView.widthAnchor.constraint(equalToConstant: 28),
        ])
    }
    
    func setupModel(transaction: TransactionModel) {
        firstLabel.text = transaction.title
        secondLabel.text = "\(transaction.category.title)"
        amountMoneyLabel.text = "\(transaction.amount)"
    }
}


