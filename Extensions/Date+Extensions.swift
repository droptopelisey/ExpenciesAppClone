//
//  Date+Extensions.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 24.01.2024.
//

import Foundation

extension Date {
    public var removeTime: Date? {
       guard let date = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: self)) else {
        return nil
       }
       return date
   }
}
