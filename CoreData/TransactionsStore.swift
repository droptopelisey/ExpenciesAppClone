//
//  TransactionsStore.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 04.01.2024.
//

import Foundation
import CoreData

protocol TransactionsStoreProtocol {
    
    func getData() -> [TransactionModel]
    
    func saveData(_ data: TransactionModel)
}

class TransactionsStore: NSObject, TransactionsStoreProtocol {
    
    let context: NSManagedObjectContext
    
    private lazy var rezultController = {
        let request = TransactionCD.fetchRequest()
        request.sortDescriptors = [
            NSSortDescriptor(key: "date", ascending: false)
        ]
        let controller = NSFetchedResultsController(
            fetchRequest: request,
            managedObjectContext: context,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        controller.delegate = self
        do {
           try controller.performFetch()
        } catch {
            print(error.localizedDescription)
        }
        
        return controller
    }()
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func getData() -> [TransactionModel] {
        rezultController.fetchedObjects?.compactMap {
            TransactionModel(
                title: $0.name ?? "",
                amount: $0.amount,
                category: Category(picture: $0.category?.pictureNmae ?? "", title: $0.category?.name ?? ""),
                date: $0.date ?? Date(),
                note: $0.note ?? "",
                expenceIncome: $0.expenceIncome
                
            )
        } ?? []
    }
    
    func saveData(_ data: TransactionModel) {
        let categoryRequest = CategoryCD.fetchRequest()
        let category: CategoryCD
        categoryRequest.predicate = NSPredicate(format: "%K = %@", #keyPath(CategoryCD.name), data.category.title)
        do {
           category = try context.fetch(categoryRequest).first!
            
        } catch {
            print(error.localizedDescription)
            return
        }
        
        let transactionCD = TransactionCD(context: context)
        transactionCD.name = data.title
        transactionCD.amount = data.amount
        transactionCD.date = data.date
        transactionCD.expenceIncome = data.expenceIncome
        transactionCD.category = category
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    
}

extension TransactionsStore: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        print("Worked")
    }
}
