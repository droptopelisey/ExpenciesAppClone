//
//  SettingsManager.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 23.12.2023.
//

import Foundation

class SettingsManager {
    
    static let shared: SettingsManager = .init()
    
    private init() { }
    
    enum Keys: String {
        case isFaceID
        case isNotification
        case notificationTime
        case isFirstTime
    }
    
    var isFaceID: Bool {
        get {
            UserDefaults.standard.bool(forKey: Keys.isFaceID.rawValue) 
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.isFaceID.rawValue)
        }
    }
    
    var isNotification: Bool {
        get {
            UserDefaults.standard.bool(forKey: Keys.isNotification.rawValue)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.isNotification.rawValue)
        }
    }
    
    var notificationTime: Date? {
        get {
            UserDefaults.standard.value(forKey: Keys.notificationTime.rawValue) as? Date
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.notificationTime.rawValue)
        }
    }
    
    var isFirstTimeHere: Bool {
        get {
            !UserDefaults.standard.bool(forKey: Keys.isFirstTime.rawValue)
        }
        set {
            UserDefaults.standard.set(!newValue, forKey: Keys.isFirstTime.rawValue)
        }
    }
    
}
