//
//  RowView.swift
//  EateriesCoreData
//
//  Created by Kieran Murphy on 14/5/21.
//

import SwiftUI

struct RowView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var eatery: Eatery
    var body: some View {
        /*TextField("Enter Eatery Name", text: $eatery.nameString, onCommit: {
            try? viewContext.save()
        })*/
        Text(eatery.nameString)
    }
}
