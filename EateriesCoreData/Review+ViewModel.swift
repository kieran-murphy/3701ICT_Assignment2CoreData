//
//  Review+ViewModel.swift
//  EateriesCoreData
//
//  Created by Kieran Murphy on 14/5/21.
//

import Foundation
import CoreData

extension Review {
    var nameString: String {
        get { name ?? ""}
        set { name = newValue }
    }
}
