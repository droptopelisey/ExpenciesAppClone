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
       mockData = TransactionsStoreClone1.shared.getData()
    }
    
    func removeData(at index: Int) {
        mockData.remove(at: index)
    }
}

