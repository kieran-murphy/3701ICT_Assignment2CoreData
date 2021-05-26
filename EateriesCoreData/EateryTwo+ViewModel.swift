//
//  EateryTwo+ViewModel.swift
//  EateriesCoreData
//
//  Created by Kieran Murphy on 26/5/21.
//

import Foundation
import CoreData
import CoreLocation

struct EateryTwo {
    var id = UUID()
    ///The name of the eatery
    var name: String
    ///The geographic positioning of the eatery
    var location: String
    ///Some information about the eatery
    var notes: String
    ///Some feedback critics had about the eatery
    var reviews: [String] = []
    ///A URL that points to where the eatery's image is stored on the internet
    var url: String = ""
}
