//
//  TransactionsStoreClone1.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 07.01.2024.
//

import Foundation
import CoreData

protocol TransactionsStoreProtocol {
    func getData() -> [TransactionModel]
    func getDataLastDay() -> [TransactionModel]
    func save(_ data: TransactionModel)
}

class TransactionsStore: NSObject, TransactionsStoreProtocol {
    
    static let shared = TransactionsStore(context: CoreDataConteiner.shared.persistentContainer.viewContext)
    
    var context: NSManagedObjectContext
    
    private lazy var rezultController1 = {
        
        let request = TransactionCD.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        
        let controller = NSFetchedResultsController(
            fetchRequest: request,
            managedObjectContext: context,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        try? controller.performFetch()
        return controller
    }()
    
    private lazy var rezultController2 = {
        
        let request = TransactionCD.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        request.predicate = NSPredicate(format: "date == %@", Date().removeTime! as NSDate)
        let controller = NSFetchedResultsController(
            fetchRequest: request,
            managedObjectContext: context,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        try? controller.performFetch()
        return controller
    }()
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func getData() -> [TransactionModel] {
        try? rezultController1.performFetch()
        return rezultController1.fetchedObjects?.compactMap {
            TransactionModel(
                title: $0.name ?? "",
                amount: $0.amount,
                category: CategoryModel(picture: $0.category?.pictureName ?? "", title: $0.category?.name ?? ""),
                date: $0.date ?? Date(),
                note: $0.note ?? "",
                expenceIncome: $0.expenceIncome
            )
        }
        ?? []
    }
    
    func getDataLastDay() -> [TransactionModel] {
        try? rezultController1.performFetch()
        
        let rezultObjects = rezultController1.fetchedObjects?
            .filter {
                $0.date?.removeTime == Date().removeTime
            }
            .compactMap {
            TransactionModel(
                title: $0.name ?? "",
                amount: $0.amount,
                category: CategoryModel(picture: $0.category?.pictureName ?? "", title: $0.category?.name ?? ""),
                date: $0.date ?? Date(),
                note: $0.note ?? "",
                expenceIncome: $0.expenceIncome
            )
        }
        ?? []
        
        return rezultObjects
    }
    
    func getDataLastDay2() -> [TransactionModel] {
        try? rezultController2.performFetch()
        
        let rezultObjects = rezultController2.fetchedObjects?
        
            
            .compactMap {
            TransactionModel(
                title: $0.name ?? "",
                amount: $0.amount,
                category: CategoryModel(picture: $0.category?.pictureName ?? "", title: $0.category?.name ?? ""),
                date: $0.date ?? Date(),
                note: $0.note ?? "",
                expenceIncome: $0.expenceIncome
            )
        }
        ?? []
        
        return rezultObjects
    }
    
    func save(_ data: TransactionModel) {
        let model = TransactionCD(context: context)
        model.name = data.title
        model.note = data.note
        model.amount = data.amount
        model.expenceIncome = data.expenceIncome
        model.date = data.date
        let categoryRequest = CategoryCD.fetchRequest()
        categoryRequest.predicate = NSPredicate(format: "%K = %@", #keyPath(CategoryCD.name), data.category.title)
        do {
            model.category = try context.fetch(categoryRequest).first
        } catch {
            print(error.localizedDescription)
        }
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
//    func todayTransactions() -> [TransactionModel] {
//        let transactions: [TransactionModel] = []
//        let request = TransactionCD.fetchRequest()
//        categoryRequest.predicate = NSPredicate(format: "%K = %@", #keyPath(CategoryCD.name), data.title)
//        try? controller.performFetch()
//    }
}
