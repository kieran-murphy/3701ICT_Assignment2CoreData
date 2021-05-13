//
//  Eatery+ViewModel.swift
//  EateriesCoreData
//
//  Created by Kieran Murphy on 13/5/21.
//

import Foundation

extension Eatery {
    var nameString: String {
        get { name ?? ""}
        set { name = newValue }
    }
}
