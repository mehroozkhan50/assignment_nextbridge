//
//  ListingDetailView.swift
//  assignment_nextbridge
//
//  Created by Mehrooz Khan on 9/5/24.
//


import SwiftUI

struct ListingDetailView: View {
    let listing: Results
    
    var body: some View {
       // ScrollView {
            VStack {
                
                if let imageUrl = listing.imageUrls?.first, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { image in
                        image.resizable().aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                Text(listing.name ?? "No name available")
                    .font(.title)
                    .padding(.top)
                
                Text(listing.price ?? "No price available")
                    .font(.headline)
                    .foregroundColor(.green)
                    .padding(.top, 5)
                
                Text("Created At: \(listing.createdAt ?? "Unknown")")
                    .font(.footnote)
                    .padding(.top, 5)
                
                Spacer()
            }
            .padding()
            .navigationTitle(listing.name ?? "Listing Details")
        //}
    }
}
