//
//  Eatery+ViewModel.swift
//  EateriesCoreData
//
//  Created by Kieran Murphy on 13/5/21.
//

import Foundation
import CoreData

extension Eatery {
    var nameString: String {
        get { name ?? ""}
        set { name = newValue }
    }
    
    var locationString: String {
        get { location ?? ""}
        set { location = newValue }
    }
    
    var notesString: String {
        get { notes ?? ""}
        set { notes = newValue }
    }
    
    var urlString: String {
        get { url ?? ""}
        set { url = newValue }
    }
    
    var reviewsArray: [Review] {
        get { reviews?.array as? [Review] ?? [] }
        set { reviews = NSOrderedSet(array: newValue) }
    }
    
    var viewContext: NSManagedObjectContext {
        managedObjectContext ?? NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    }
    
    func addItem() {
        
            let newReview = Review(context: viewContext)
            newReview.name = "Review"
            newReview.reviewID = "Yeeto"
            
            addToReviews(newReview)
        //  newReview.eatery = self

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
        
        offsets.map { reviewsArray[$0] }.forEach(viewContext.delete)

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
