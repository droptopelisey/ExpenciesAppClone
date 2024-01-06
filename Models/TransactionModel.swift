//
//  TransactionModel.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 06.12.2023.
//

import Foundation

struct TransactionModel {
    var title: String
    var amount: Double
    var category: Category
    var date: Date
    var note: String
    var expenceIncome: Bool
}

struct Category {
    var picture: String
    var title: String
}


extension TransactionModel {
    var dateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE , d MMMM , yyyy"
        return formatter.string(from: date) 
    }
}
