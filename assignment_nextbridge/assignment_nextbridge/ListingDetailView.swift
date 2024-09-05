//
//  ListingDetailView.swift
//  assignment_nextbridge
//
//  Created by Mehrooz Khan on 9/5/24.
//


import SwiftUI

struct ListingDetailView: View {
    let listing: Listing
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: listing.image)) { image in
                image.resizable().aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(height: 300)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text(listing.title)
                .font(.title)
                .padding(.top)
            
            Text(listing.price)
                .font(.headline)
                .foregroundColor(.green)
                .padding(.top, 5)
            
            Text(listing.description)
                .font(.body)
                .padding(.top, 10)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Listing Details")
    }
}
