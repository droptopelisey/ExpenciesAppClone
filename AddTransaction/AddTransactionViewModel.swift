//
//  AddTransactionViewModel.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 30.12.2023.
//

import Foundation


protocol AddTransactionModelProtocol {
    var callback: (() -> Void)? { get set }
    func save(model: TransactionModel)
}

class AddTransactionViewModel: AddTransactionModelProtocol {
    var callback: (() -> Void)?
    
    func save(model: TransactionModel) {
        TransactionsStoreClone1.shared.saveData(model)
    }
}
