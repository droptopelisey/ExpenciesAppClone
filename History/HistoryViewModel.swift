//
//  HistoryViewModel.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 11.12.2023.
//

import Foundation

protocol HistoryViewModelProtocol {
    var callback: (() -> Void)? { get set }
}

class HistoryViewModel: HistoryViewModelProtocol {
    var callback: (() -> Void)?
}
