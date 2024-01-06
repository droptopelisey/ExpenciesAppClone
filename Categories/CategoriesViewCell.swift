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
        let pic = UIImageView(image: UIImage(systemName: "plus"))
        pic.translatesAutoresizingMaskIntoConstraints = false
        return pic
    }()
    
    private lazy var title = {
        let title = UILabel(frame: .zero)
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
        addSubview(title)
        
        NSLayoutConstraint.activate([
            picture.centerYAnchor.constraint(equalTo: centerYAnchor),
            picture.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            
            title.centerYAnchor.constraint(equalTo: centerYAnchor),
            title.leadingAnchor.constraint(equalTo: picture.trailingAnchor, constant: 12),
        ])
    }
}
