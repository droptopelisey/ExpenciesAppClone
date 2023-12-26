//
//  SecondSectionCell.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 10.12.2023.
//

import UIKit

class FourthSectionCell: UITableViewCell {
    
    struct Model: CellModelProtocol {
        let image: String
        let title: String
    }
    
// MARK: Subviews
    
    private lazy var cellView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var pictureView = {
        let image = UIImageView(image: UIImage(systemName: "lock"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleLabel = {
        let title = UILabel(frame: .zero)
        title.text = "Account"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
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
            setupViews()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupViews()
        }
    
// MARK: Setups
    private func setupViews() {
       addSubview(cellView)
        cellView.addSubview(pictureView)
        cellView.addSubview(titleLabel)
        cellView.addSubview(rightSidePic)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor),
            cellView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            cellView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            pictureView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 25),
            pictureView.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            pictureView.heightAnchor.constraint(equalToConstant: 25),
            pictureView.widthAnchor.constraint(equalToConstant: 25),
            
            titleLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: pictureView.trailingAnchor, constant: 15),
            
            rightSidePic.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            rightSidePic.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -15)
            
        ])
    }
    
    func setup(viewModel: CellModelProtocol) {
        guard let viewModel = viewModel as? Model else { return }
        pictureView.image = UIImage(systemName: viewModel.image)
        titleLabel.text = viewModel.title
    }
    
}
