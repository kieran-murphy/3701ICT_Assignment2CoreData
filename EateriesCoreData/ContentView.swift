//
//  ContentView.swift
//  EateriesCoreData
//
//  Created by Kieran Murphy on 13/5/21.
//

import SwiftUI
import CoreData

//check if coredata is empty
//if its not empty take data from coredata
//else
//get JSON
//for each
//assign dummydata <AllEateries>

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

