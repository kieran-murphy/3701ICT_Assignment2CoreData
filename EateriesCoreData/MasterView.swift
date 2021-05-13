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
                Text(eatery.nameString)
            }
            .onDelete(perform: allEateries.deleteItems)
        }
        .navigationBarItems(leading: EditButton(), trailing:
                                Button(action: allEateries.addItem) {
                                    Label("",
                                          systemImage: "plus")
                                })
    }
    
}
