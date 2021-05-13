//
//  ContentView.swift
//  EateriesCoreData
//
//  Created by Kieran Murphy on 13/5/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \AllEateries.name, ascending: true)],
        animation: .default)
    private var allEateries: FetchedResults<AllEateries>

    var body: some View {
        NavigationView {
            MasterView(allEateries: (allEateries.first ?? AllEateries(context: viewContext)))
        }
    }

    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}


