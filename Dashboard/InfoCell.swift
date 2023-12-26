//
//  InfoCell.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 04.12.2023.
//

import UIKit

class InfoCell: UITableViewCell {
    
// MARK: Subviews
    private lazy var cellView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var horizontalLineView = {
            let view = UIView(frame: .zero)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .gray
            return view
        }()

    private lazy var verticalLineView = {
            let view = UIView(frame: .zero)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .gray
            return view
        }()

    private lazy var balanceTextLabel = {
            let label = UILabel(frame: .zero)
            label.text = "Balance"
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

    private lazy var balanceMoneyLabel = {
            let label = UILabel(frame: .zero)
            label.text = "$ 6,150"
            label.textColor = .black
            label.font = .boldSystemFont(ofSize: 20)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    private lazy var incomeTextLabel = {
           let label = UILabel(frame: .zero)
           label.text = "Income"
           label.textColor = .black
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()

    private lazy var incomeMoneyLabel = {
           let label = UILabel(frame: .zero)
           label.text = "$ 10,000"
           label.textColor = .black
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()

    private lazy var expenceTextLabel = {
           let label = UILabel(frame: .zero)
           label.text = "Expence"
           label.textColor = .black
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()

    private lazy var expenceMoneyLabel = {
           let label = UILabel(frame: .zero)
           label.text = "$ 3,850"
           label.textColor = .black
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
    
    private lazy var pictureUp = {
       let image = UIImageView(image: UIImage(systemName: "arrowshape.up.circle.fill"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .systemGreen
        image.layer.cornerRadius = 10
        return image
    }()
    
    private lazy var pictureDown = {
       let image = UIImageView(image: UIImage(systemName: "arrowshape.down.circle.fill"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .systemRed
        image.layer.cornerRadius = 10
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
        cellView.layer.cornerRadius = 20
        cellView.addSubview(horizontalLineView)
        cellView.addSubview(verticalLineView)
        cellView.addSubview(balanceTextLabel)
        cellView.addSubview(balanceMoneyLabel)
        cellView.addSubview(incomeTextLabel)
        cellView.addSubview(incomeMoneyLabel)
        cellView.addSubview(expenceTextLabel)
        cellView.addSubview(expenceMoneyLabel)
        cellView.addSubview(pictureUp)
        cellView.addSubview(pictureDown)
        
        
        NSLayoutConstraint.activate([
                   cellView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                   cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
                   cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                   cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                   horizontalLineView.heightAnchor.constraint(equalToConstant: 1),
                   horizontalLineView.centerXAnchor.constraint(equalTo: cellView.centerXAnchor),
                   horizontalLineView.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
                   horizontalLineView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
                   horizontalLineView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),

                   verticalLineView.widthAnchor.constraint(equalToConstant: 1),
                   verticalLineView.centerXAnchor.constraint(equalTo: cellView.centerXAnchor),
                   verticalLineView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -10),
                   verticalLineView.topAnchor.constraint(equalTo: horizontalLineView.bottomAnchor, constant: 10),

                   balanceTextLabel.centerXAnchor.constraint(equalTo: cellView.centerXAnchor),
                   balanceTextLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 15),


                   balanceMoneyLabel.centerXAnchor.constraint(equalTo: cellView.centerXAnchor),
                   balanceMoneyLabel.topAnchor.constraint(equalTo: balanceTextLabel.bottomAnchor, constant: 5),

                   incomeTextLabel.topAnchor.constraint(equalTo: horizontalLineView.bottomAnchor, constant: 15),
                   incomeTextLabel.trailingAnchor.constraint(equalTo: verticalLineView.leadingAnchor, constant: -35),

                   incomeMoneyLabel.topAnchor.constraint(equalTo: incomeTextLabel.bottomAnchor, constant: 5),
                   incomeMoneyLabel.trailingAnchor.constraint(equalTo: verticalLineView.leadingAnchor, constant: -25),

                   expenceTextLabel.topAnchor.constraint(equalTo: horizontalLineView.bottomAnchor, constant: 15),
                   expenceTextLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -35),

                   expenceMoneyLabel.topAnchor.constraint(equalTo: expenceTextLabel.bottomAnchor, constant: 5),
                   expenceMoneyLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -35),
                   
                   pictureUp.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 25),
                   pictureUp.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -20),
                   pictureUp.widthAnchor.constraint(equalToConstant: 45),
                   pictureUp.heightAnchor.constraint(equalToConstant: 45),
                   
                   pictureDown.leadingAnchor.constraint(equalTo: verticalLineView.leadingAnchor, constant: 25),
                   pictureDown.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -20),
                   pictureDown.widthAnchor.constraint(equalToConstant: 45),
                   pictureDown.heightAnchor.constraint(equalToConstant: 45),
               ])
    }
}
