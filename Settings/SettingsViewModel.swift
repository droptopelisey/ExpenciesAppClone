//
//  SettingsViewModel.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 10.12.2023.
//

import Foundation

protocol SettingsViewModelProtocol {
    var callback: (() -> Void)? { get set }
    func getModel(for section: SettingsViewController.Sections, with index: Int) -> CellModelProtocol
}

protocol CellModelProtocol {
    
}

class SettingsViewModel: SettingsViewModelProtocol {
    
    struct DataType {
        
        let title: String
        let subTitle: String?
        let date: Date?
        let pictureName: String
        let isSwitchable: Bool
        let isSwitchOn: Bool
        
        init(
            title: String,
            subTitle: String? = nil,
            date: Date? = nil,
            pictureName: String,
            isSwitchable: Bool = false,
            isSwitchOn: Bool = false
        ) {
            self.title = title
            self.subTitle = subTitle
            self.date = date
            self.pictureName = pictureName
            self.isSwitchable = isSwitchable
            self.isSwitchOn = isSwitchOn
        }
    }
    
    var callback: (() -> Void)?
    
    var dataModels: [DataType] = [
        .init(title: "Maria", subTitle: "Apple Developer", date: nil, pictureName: "photo"),
        
        .init(title: "Account", subTitle: nil, date: nil, pictureName: "lock"),
        .init(title: "Currency", subTitle: nil, date: nil, pictureName: "creditcard.viewfinder"),
        
        .init(
            title: "Application Lock",
            subTitle: nil,
            date: nil,
            pictureName: "faceid",
            isSwitchable: true,
            isSwitchOn: SettingsManager.shared.isFaceID
        ),
        .init(
            title: "Notification",
            subTitle: nil,
            date: nil,
            pictureName: "bell",
            isSwitchable: true,
            isSwitchOn: SettingsManager.shared.isNotification
        ),
        
        .init(title: "Onboarding", subTitle: nil, date: nil, pictureName: "arrow.triangle.2.circlepath.doc.on.clipboard"),
        .init(title: "FAQ / Contacts", subTitle: nil, date: nil, pictureName: "questionmark.app"),
        .init(title: "Export Transactions", subTitle: nil, date: nil, pictureName: "arrow.up.doc"),
        .init(title: "About", subTitle: nil, date: nil, pictureName: "list.bullet.rectangle.portrait"),
    ]
    
    
    func getModel(for section: SettingsViewController.Sections, with index: Int) -> CellModelProtocol {
        switch section {
        case .first:
            FirstSectionSettingsCell.Model(
                name: dataModels[index].title,
                profession: dataModels[index].subTitle ?? "",
                image: dataModels[index].pictureName
            )
        case .second:
            SecondSectionCell.Model(picture: dataModels[index].pictureName, title: dataModels[index].title)
        case .third:
            ThirdSectionCell.Model(
                image: dataModels[index].pictureName,
                title: dataModels[index].title,
                date: nil, 
                isSwitchable: dataModels[index].isSwitchable,
                isSwitchOn: dataModels[index].isSwitchOn
            )
        case .fourth:
            FourthSectionCell.Model(image: dataModels[index].pictureName, title: dataModels[index].title)
        }
    }
}




