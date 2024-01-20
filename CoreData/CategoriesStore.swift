//
//  CategoriesStore.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 20.01.2024.
//

import Foundation
import CoreData

protocol CategoriesStoreProtocol {
    func getData() -> [Category]
}

class CategoriesStore: NSObject, CategoriesStoreProtocol {
    static let shared = CategoriesStore(context: CoreDataConteiner.shared.persistentContainer.viewContext)
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func setupDefaultCategories() {
        let categories: [Category] = [
            Category(picture: "bus.fill", title: "Public Transportation"),
            Category(picture: "car.front.waves.up", title: "Taxi"),
            Category(picture: "iphone.gen1", title: "Mobile Phone"),
            Category(picture: "film", title: "Movies & DVDs"),
            Category(picture: "creditcard", title: "Bank Fee"),
            Category(picture: "creditcard", title: "Finance Charge"),
            Category(picture: "basket", title: "Groceries"),
            Category(picture: "fork.knife", title: "Restaurants"),
            Category(picture: "house.lodge", title: "Rent"),
            Category(picture: "lightbulb.led", title: "Home Supplies"),
            Category(picture: "dollarsign", title: "Paycheque"),
            Category(picture: "gamecontroller", title: "Software"),
            Category(picture: "arrow.left.arrow.right", title: "Credit Card Payment"),
        ]
        categories.forEach {
            let categoryCD = CategoryCD(context: context)
            categoryCD.pictureName = $0.picture
            categoryCD.name = $0.title
        }
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getData() -> [Category] {
        let categoriesRequest = CategoryCD.fetchRequest()
        categoriesRequest.sortDescriptors = [
            NSSortDescriptor(key: "pictureName", ascending: true)
        ]
        do {
            let categoriesCD = try context.fetch(categoriesRequest)
            return categoriesCD.compactMap {
                Category(picture: $0.pictureName ?? "", title: $0.name ?? "")
            }
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
}
