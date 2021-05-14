//
//  AllEateries+ViewModel.swift
//  EateriesCoreData
//
//  Created by Kieran Murphy on 14/5/21.
//

import Foundation
import CoreData

extension AllEateries {
    var nameString: String {
        get { name ?? ""}
        set { name = newValue }
    }
    
    var eateriesArray: [Eatery] {
        get { eateries?.array as? [Eatery] ?? [] }
        set { eateries = NSOrderedSet(array: newValue) }
    }
    
    var viewContext: NSManagedObjectContext {
        managedObjectContext ?? NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    }
    
    func addItem() {
        
            let newEatery = Eatery(context: viewContext)
            newEatery.name = "Eatery"
            newEatery.location = "Enter Location Here"
            addToEateries(newEatery)
            
        //  newEatery.planet = self

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        
    }

    func deleteItems(offsets: IndexSet) {
        
        offsets.map { eateriesArray[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    
}
