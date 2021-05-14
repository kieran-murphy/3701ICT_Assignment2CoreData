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
        List {
            ForEach(eatery.reviewsArray) { review in
                Text(review.name)
//                NavigationLink(
//                    destination: ReviewView(review: review),
//                    label: {
//                        ReviewRowView(review: review)
//                    }) {
                    
                }
            }
            .onDelete { offsets in
                withAnimation {
                    review.deleteItems(offsets: offsets)
                }
            }
        }
        .navigationBarItems(leading: EditButton(), trailing: Button(action: {
            withAnimation {
                eatery.addItem()
            }
        }) {
            Label("", systemImage: "plus")
        })
    }
    

