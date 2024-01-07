//
//  TransactionsStoreClone1.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 07.01.2024.
//

import Foundation
import CoreData

protocol TransactionsStoreClone1Protocol {
    
    func getData() -> [TransactionModel]
    
    func save(_ data: TransactionModel)
}

class TransactionsStoreClone1: NSObject, TransactionsStoreProtocol {
    
    static let shared = TransactionsStoreClone1(context: CoreDataConteiner.shared.persistentContainer.viewContext)
    
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
    
   
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func getData() -> [TransactionModel] {
        rezultController1.fetchedObjects?.compactMap {
            TransactionModel(
                title: $0.name ?? "",
                amount: $0.amount,
                category: Category(picture: $0.category?.pictureNmae ?? "", title: $0.category?.name ?? ""),
                date: $0.date ?? Date(),
                note: $0.note ?? "",
                expenceIncome: $0.expenceIncome
            )
        }
        ?? []
    }
    
    func saveData(_ data: TransactionModel) {
        var model = TransactionCD(context: context)
        model.name = data.title
        model.note = data.note
        model.amount = data.amount
        model.expenceIncome = data.expenceIncome
        model.date = data.date
        let categoryRequest = CategoryCD.fetchRequest()
        categoryRequest.predicate = NSPredicate(format: "%K = %@", #keyPath(CategoryCD.name), data.title)
        do {
            model.category = try context.fetch(categoryRequest).first
        } catch {
            print(error.localizedDescription)
        }
        try? context.save()
    }
}
