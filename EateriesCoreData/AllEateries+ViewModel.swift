//
//  AllEateries+ViewModel.swift
//  EateriesCoreData
//
//  Created by Kieran Murphy on 14/5/21.
//

import Foundation
import CoreData

/// A collection of all the best eateries on planet Earth
extension AllEateries {
    /// The name of the collection AllEateries
    var nameString: String {
        get { name ?? ""}
        set { name = newValue }
    }
    /// Stores the list of eateries as an NSOrderedSet
    var eateriesArray: [Eatery] {
        get { eateries?.array as? [Eatery] ?? [] }
        set { eateries = NSOrderedSet(array: newValue) }
    }
    
    var viewContext: NSManagedObjectContext {
        managedObjectContext ?? NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    }
    /// Adds a new eatery to the list within AllEateries
    func addItem() {
            let newEatery = Eatery(context: viewContext)
            newEatery.name = "Eatery"
            newEatery.location = "Location"
            newEatery.notes = ""
            newEatery.url = "https://i.imgur.com/y3MMnba.png"
            addToEateries(newEatery)
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        
    }
    /// Deletes an eatery from the list of AllEateries
    func deleteItems(offsets: IndexSet) {
        offsets.map { eateriesArray[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    
    func moveItems(from: IndexSet, to: Int) {
        eateriesArray.move(fromOffsets: from, toOffset: to)
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            } 
        } 
    
}
