//
//  EateriesCoreDataApp.swift
//  EateriesCoreData
//
//  Created by Kieran Murphy on 13/5/21.
//

import SwiftUI

@main
struct EateriesCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
