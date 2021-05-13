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
        sortDescriptors: [NSSortDescriptor(keyPath: \Eatery.name, ascending: true)],
        animation: .default)
    private var eateries: FetchedResults<Eatery>

    var body: some View {
        NavigationView {
            MasterView(eateries: eateries)
        }
    }

    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}


