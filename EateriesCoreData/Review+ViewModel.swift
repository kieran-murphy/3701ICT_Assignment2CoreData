//
//  Review+ViewModel.swift
//  EateriesCoreData
//
//  Created by Kieran Murphy on 14/5/21.
//

import Foundation
import CoreData

/// A piece of feedback for an eatery
extension Review {
    /// Creates the content of the review
    var nameString: String {
        get { name ?? ""}
        set { name = newValue }
    }
}
