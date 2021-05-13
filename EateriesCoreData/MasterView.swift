//
//  MasterView.swift
//  EateriesCoreData
//
//  Created by Kieran Murphy on 13/5/21.
//

import SwiftUI

struct MasterView: View {
    @Environment(\.managedObjectContext) private var viewContext
    var eateries: FetchedResults<Eatery>
    var body: some View {
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
    func addItem() {
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

    func deleteItems(offsets: IndexSet) {
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
