//
//  MasterView.swift
//  EateriesCoreData
//
//  Created by Kieran Murphy on 13/5/21.
//

import SwiftUI
import CoreData

struct MasterView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var allEateries: AllEateries
    
    
    var body: some View {
        List {
            ForEach(allEateries.eateriesArray) { eatery in
                NavigationLink(
                    destination: DetailView(eatery: eatery),
                    label: {
                        RowView(eatery: eatery)
                    })
            }
            .onDelete { offsets in
                withAnimation {
                    allEateries.deleteItems(offsets: offsets)
                }
            }
            
            .onMove(perform:
                allEateries.moveItems
            )
            }
            .navigationTitle("Eateries")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                withAnimation {
                    allEateries.addItem()
            }
        }) {
            Label("", systemImage: "plus")
        })
    }
    
}



