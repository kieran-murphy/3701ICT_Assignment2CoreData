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
            List {
                ForEach(eateries) { eatery in
                    Text(eatery.nameString)
                }
                .onDelete(perform: deleteItems)
            }
            .navigationBarItems(leading: EditButton(), trailing:
                                    Button(action: addItem) {
                                        Label("",
                                              systemImage: "plus")
                                    })
        }
    }

    private func addItem() {
        withAnimation {
            let newEatery = Eatery(context: viewContext)
            newEatery.name = "Eatery"

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { eateries[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
