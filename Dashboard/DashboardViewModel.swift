//
//  DashboardViewModel.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 04.12.2023.
//

import Foundation

protocol DashboardViewModelProtocol {
    var callback: (() -> Void)? { get set }
    var mockData: [TransactionModel] { get }
    func getData()
    func removeData(at index: Int)
}

class DashboardViewModel: DashboardViewModelProtocol {
    var callback: (() -> Void)?
    
    
    var mockData: [TransactionModel] = [] {
        didSet {
            callback?()
        }
    }
    
    func getData() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { [weak self ] _ in
            self?.mockData = [
                TransactionModel(title: "qqq", amount: 123.0, category: Category(picture: "pic", title: "hhh1"), date: Date(), note: "123"),
                TransactionModel(title: "vwv", amount: 223, category: Category(picture: "hhh", title: "hhh2"), date: Date(), note: "223"),
                TransactionModel(title: "jjg", amount: 665, category: Category(picture: "nnn", title: "hhh3"), date: Date(), note: "323"),
                TransactionModel(title: "lll", amount: 456, category: Category(picture: "ggg", title: "hhh5"), date: Date(), note: "423"),
            ]
        }
    }
    
    func removeData(at index: Int) {
        mockData.remove(at: index)
    }
}

