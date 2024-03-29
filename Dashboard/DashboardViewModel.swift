//
//  DashboardViewModel.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 04.12.2023.
//

import Foundation

protocol DashboardViewModelProtocol {
    var callback: (() -> Void)? { get set }
    var data: [TransactionModel] { get }
    func getData()
    func removeData(at index: Int)
    func getBalance() -> (amount: Double, income: Double, expence: Double)
}

class DashboardViewModel: DashboardViewModelProtocol {
    var callback: (() -> Void)?
    
    
    
    var data: [TransactionModel] = [] {
        didSet {
            callback?()
        }
    }
    
    func getData() {
        data = TransactionsStore.shared.getDataLastDay2()
    }
    
    func removeData(at index: Int) {
        data.remove(at: index)
    }
    
    func getBalance() -> (amount: Double, income: Double, expence: Double) {
        var amount: Double = 0.0
        var income: Double = 0.0
        var expence: Double = 0.0
        data.forEach {
            income += $0.expenceIncome == false ? $0.amount : 0
            expence += $0.expenceIncome ? $0.amount : 0
        }
        amount = income - expence
        return (amount, income, expence)
    }
}

