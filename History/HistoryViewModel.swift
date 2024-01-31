//
//  HistoryViewModel.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 11.12.2023.
//

import Foundation

protocol HistoryViewModelProtocol {
    var callback: (() -> Void)? { get set }
    var transactions: [TransactionModel] { get }
    func getTransactions()
}

class HistoryViewModel: HistoryViewModelProtocol {
    
    var transactions: [TransactionModel] = [] {
        didSet {
            callback?()
        }
    }
    
    var callback: (() -> Void)?
    
    func getTransactions() {
        transactions = TransactionsStore.shared.getData()
    }
}
