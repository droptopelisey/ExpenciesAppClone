//
//  SecondSectionCell.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 10.12.2023.
//

import UIKit

class ThirdSectionCell: UITableViewCell {
    
    struct Model: CellModelProtocol {
        let image: String
        let title: String
        let date: Date?
        let isSwitchable: Bool
        let isSwitchOn: Bool
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
    
    private lazy var dateLabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(Data())"
        return label
    }()
    
    private lazy var switchThing = {
        let thing = UISwitch()
        thing.translatesAutoresizingMaskIntoConstraints = false
        return thing
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
        contentView.addSubview(cellView)
        cellView.addSubview(pictureView)
        cellView.addSubview(titleLabel)
        cellView.addSubview(dateLabel)
        cellView.addSubview(switchThing)
        
        switchThing.addTarget(self, action: #selector(swichAction), for: .touchUpInside)
        
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
            
            dateLabel.trailingAnchor.constraint(equalTo: switchThing.leadingAnchor, constant: -30),
            dateLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            
            switchThing.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            switchThing.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20),
            
        ])
    }
    
    @objc
    func swichAction() {
        if titleLabel.text == "Application Lock" {
            SettingsManager.shared.isFaceID = switchThing.isOn
        } else if titleLabel.text == "Notification"{
            SettingsManager.shared.isNotification = switchThing.isOn
        }
        print(SettingsManager.shared.isFaceID)
        print(SettingsManager.shared.isNotification)
    }
    
    func setup(viewModel: CellModelProtocol) {
        guard let viewModel = viewModel as? Model else { return }
        print(viewModel.isSwitchOn)
        print(SettingsManager.shared.isFaceID)
        print(SettingsManager.shared.isNotification)
        print(viewModel.title)
      
        pictureView.image = UIImage(systemName: viewModel.image)
        titleLabel.text = viewModel.title
        dateLabel.text = String(describing: viewModel.date)
        switchThing.isHidden = !viewModel.isSwitchable
        switchThing.isOn = viewModel.isSwitchOn
    }
}
