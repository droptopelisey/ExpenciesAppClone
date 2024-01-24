//
//  CategoriesStore.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 20.01.2024.
//

import Foundation
import CoreData

protocol CategoriesStoreProtocol {
    func getData() -> [CategoryModel]
}

class CategoriesStore: NSObject, CategoriesStoreProtocol {
    static let shared = CategoriesStore(context: CoreDataConteiner.shared.persistentContainer.viewContext)
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func setupDefaultCategories() {
        let categories: [CategoryModel] = [
            CategoryModel(picture: "bus.fill", title: "Public Transportation"),
            CategoryModel(picture: "car.front.waves.up", title: "Taxi"),
            CategoryModel(picture: "iphone.gen1", title: "Mobile Phone"),
            CategoryModel(picture: "film", title: "Movies & DVDs"),
            CategoryModel(picture: "creditcard", title: "Bank Fee"),
            CategoryModel(picture: "creditcard", title: "Finance Charge"),
            CategoryModel(picture: "basket", title: "Groceries"),
            CategoryModel(picture: "fork.knife", title: "Restaurants"),
            CategoryModel(picture: "house.lodge", title: "Rent"),
            CategoryModel(picture: "lightbulb.led", title: "Home Supplies"),
            CategoryModel(picture: "dollarsign", title: "Paycheque"),
            CategoryModel(picture: "gamecontroller", title: "Software"),
            CategoryModel(picture: "arrow.left.arrow.right", title: "Credit Card Payment"),
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
    
    func getData() -> [CategoryModel] {
        let categoriesRequest = CategoryCD.fetchRequest()
        categoriesRequest.sortDescriptors = [
            NSSortDescriptor(key: "pictureName", ascending: true)
        ]
        do {
            let categoriesCD = try context.fetch(categoriesRequest)
            return categoriesCD.compactMap {
                CategoryModel(picture: $0.pictureName ?? "", title: $0.name ?? "")
            }
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
}
