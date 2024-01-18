//
//  AddCategoryTableViewCell.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 30.12.2023.
//

import UIKit

class AddCategoryTableViewCell: UITableViewCell {
    
    
    // MARK: Subviews
    
    private lazy var categoryPic = {
       let image = UIImageView(image: UIImage(systemName: "car.fill"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .systemGreen
        image.layer.cornerRadius = 10
        return image
    }()
    
    private lazy var categoryLabel = {
        let label = UILabel(frame: .zero)
        label.text = "Category"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var rightSidePic = {
       let image = UIImageView(image: UIImage(systemName: "chevron.right"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .lightGray
        return image
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
        addSubview(categoryPic)
        addSubview(categoryLabel)
        addSubview(rightSidePic)
        
        NSLayoutConstraint.activate([
            categoryPic.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            categoryPic.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            
            categoryLabel.leadingAnchor.constraint(equalTo: categoryPic.trailingAnchor, constant: 24),
            categoryLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            
            rightSidePic.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            rightSidePic.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12)
        ])
        
    }
    
    func setup(picture: String, title: String) {
        categoryPic.image = UIImage(systemName: picture)
        categoryLabel.text = title
    }
}
