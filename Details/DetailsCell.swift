//
//  DetailsCell.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 07.12.2023.
//

import UIKit

class DetailsCell: UITableViewCell {
    
// MARK: Subviews
        
    private lazy var titleLabel = {
        let label = UILabel(frame: .zero)
        label.text = "Title"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var meaningLabel = {
        let label = UILabel(frame: .zero)
        label.text = "Air Pods pro 2"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var pictureView = {
        let image = UIImage(systemName: "plus")
        return image
    }()
    
    
// MARK: Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    // MARK: Setups
    
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(meaningLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 3),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            meaningLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3),
            meaningLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
    
        ])
    }
    
    func setup(title: String, meaning: String?) {
        titleLabel.text = title
        meaningLabel.text = meaning
    }
}
