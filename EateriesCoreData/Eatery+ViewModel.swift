//
//  Eatery+ViewModel.swift
//  EateriesCoreData
//
//  Created by Kieran Murphy on 13/5/21.
//

import Foundation
import CoreData
import CoreLocation

///🍽 A place where humans can exchange their currency for food
extension Eatery {
    ///The name of the eatery
    var nameString: String {
        get { name ?? ""}
        set { name = newValue }
    }
    ///The geographic positioning of the eatery
    var locationString: String {
        get { location ?? ""}
        set { location = newValue }
    }
    ///Some information about the eatery
    var notesString: String {
        get { notes ?? ""}
        set { notes = newValue }
    }
    ///A URL that points to where the eatery's image is stored on the internet
    var urlString: String {
        get { url ?? ""}
        set { url = newValue }
    }
    ///Some feedback critics had about the eatery
    var reviewsArray: [Review] {
        get { reviews?.array as? [Review] ?? [] }
        set { reviews = NSOrderedSet(array: newValue) }
    }
    
    var latitudeString: String {
        get { latitude ?? ""}
        set { latitude = newValue }
    }
    
    var longitudeString: String {
        get { longitude ?? ""}
        set { longitude = newValue }
    }
    
    var viewContext: NSManagedObjectContext {
        managedObjectContext ?? NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    }
    
    func addItem() {
        
            let newReview = Review(context: viewContext)
            newReview.name = "Review"
            newReview.reviewID = "Yeeto"
            addToReviews(newReview)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        
    }

    func deleteItems(offsets: IndexSet) {
        
        offsets.map { reviewsArray[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    
}
