//
//  Eatery+CoreDataProperties.swift
//  EateriesCoreData
//
//  Created by Kieran Murphy on 13/5/21.
//
//

import Foundation
import CoreData


extension Eatery {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Eatery> {
        return NSFetchRequest<Eatery>(entityName: "Eatery")
    }

    @NSManaged public var name: String?
    @NSManaged public var reviews: NSOrderedSet?
    @NSManaged public var planet: AllEateries?

}

// MARK: Generated accessors for reviews
extension Eatery {

    @objc(addReviewsObject:)
    @NSManaged public func addToReviews(_ value: Review)

    @objc(removeReviewsObject:)
    @NSManaged public func removeFromReviews(_ value: Review)

    @objc(addReviews:)
    @NSManaged public func addToReviews(_ values: NSSet)

    @objc(removeReviews:)
    @NSManaged public func removeFromReviews(_ values: NSSet)

}

extension Eatery : Identifiable {

}
