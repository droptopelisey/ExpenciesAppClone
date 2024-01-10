//
//  CategoriesViewCell.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 06.01.2024.
//

import UIKit

class CategoriesViewCell: UITableViewCell {
    
    // MARK: Subviews
    
    private lazy var picture = {
        let pic = UIImageView(image: UIImage(systemName: "arrowshape.up.circle.fill"))
        pic.backgroundColor = .green
        pic.layer.cornerRadius = 20
        pic.translatesAutoresizingMaskIntoConstraints = false
        return pic
    }()
    
    private lazy var titleLabel = {
        let title = UILabel(frame: .zero)
        title.text = "Title"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
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
       addSubview(picture)
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            picture.centerYAnchor.constraint(equalTo: centerYAnchor),
            picture.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            picture.heightAnchor.constraint(equalToConstant: 44),
            picture.widthAnchor.constraint(equalToConstant: 44),
            
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: picture.trailingAnchor, constant: 10),
        ])
    }
    
    
    func setupPicture(name: String) {
        picture.image = UIImage(systemName: name)
    }
    
    func setupLabel(title: String) {
        titleLabel.text = title
    }
}
