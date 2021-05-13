//
//  Review+CoreDataProperties.swift
//  EateriesCoreData
//
//  Created by Kieran Murphy on 13/5/21.
//
//

import Foundation
import CoreData


extension Review {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Review> {
        return NSFetchRequest<Review>(entityName: "Review")
    }

    @NSManaged public var reviewID: String?
    @NSManaged public var name: String?
    @NSManaged public var eatery: Eatery?

}

extension Review : Identifiable {

}
