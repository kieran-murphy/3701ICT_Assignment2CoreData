//
//  DetailView.swift
//  EateriesCoreData
//
//  Created by Kieran Murphy on 14/5/21.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var eatery: Eatery
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    TextField("Enter Name Here", text: $eatery.nameString, onCommit: {
                        try? viewContext.save()
                    })
                    .padding(.leading)
                    .font(.system(size: 30, weight: .heavy, design: .default))
                    
                    TextField("Enter Location Here", text: $eatery.locationString, onCommit: {
                        try? viewContext.save()
                    })
                    .padding(.leading)
                    .font(Font.headline.weight(.thin))
                
                }
            }
        List {
            ForEach(eatery.reviewsArray) { review in
                ReviewRowView(review: review)
//                NavigationLink(
//                    destination: ReviewView(review: review),
//                    label: {
//                        ReviewRowView(review: review)
//                    }) {
                    
                }
            
            .onDelete { offsets in
                withAnimation {
                    eatery.deleteItems(offsets: offsets)
                }
            }
        }
        .navigationBarItems(trailing: Button(action: {
            withAnimation {
                eatery.addItem()
            }
        }) {
            Label("", systemImage: "plus")
        })
                
        }
    }

}

struct ReviewRowView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var review: Review
    var body: some View {
        //Text(review.reviewID ?? "")
        TextField("Enter Review Name", text: $review.nameString, onCommit: {
            try? viewContext.save()
        })
    }
}

