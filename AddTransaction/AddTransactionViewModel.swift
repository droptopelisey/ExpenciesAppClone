//
//  AddTransactionViewModel.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 30.12.2023.
//

import Foundation


protocol AddTransactionModelProtocol {
    var callback: (() -> Void)? { get set }
}

class AddTransactionViewModel: AddTransactionModelProtocol {
    var callback: (() -> Void)?
}
