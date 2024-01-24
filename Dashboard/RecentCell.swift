//
//  RecentCell.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 04.12.2023.
//

import UIKit

class RecentCell: UITableViewCell {
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
            cellView.topAnchor.constraint(equalTo: topAnchor),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            firstLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 12),
            firstLabel.leadingAnchor.constraint(equalTo: pictureView.leadingAnchor, constant: 56),
            
            secondLabel.topAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -56),
            secondLabel.leadingAnchor.constraint(equalTo: pictureView.leadingAnchor, constant: 56),
            
            thirdLabel.topAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -28),
            thirdLabel.leadingAnchor.constraint(equalTo: pictureView.leadingAnchor, constant: 56),
            
            amountMoneyLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            amountMoneyLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -12),
            
            pictureView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 12),
            pictureView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -12),
            pictureView.heightAnchor.constraint(equalToConstant: 44),
            pictureView.widthAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    func setupModel(transaction: TransactionModel) {
        firstLabel.text = transaction.title
        secondLabel.text = "\(transaction.category.title)"
        amountMoneyLabel.text = "\(transaction.amount)"
        thirdLabel.text = transaction.dateString
        pictureView.image = UIImage(systemName: transaction.category.picture)
    }
}


