//
//  ListingsView.swift
//  assignment_nextbridge
//
//  Created by Mehrooz Khan on 9/5/24.
//

import SwiftUI

struct ListingsView: View {
    @StateObject var viewModel = ListingsViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.listings) { listing in
                NavigationLink(destination: ListingDetailView(listing: listing)) {
                    ListingRow(listing: listing)
                }
            }
            .navigationTitle("Classifieds")
            .onAppear {
                viewModel.loadListings()
            }
            .overlay(
                Group {
                    if viewModel.isLoading {
                        ProgressView("Loading...")
                    }
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                    }
                }
            )
        }
    }
}

struct ListingRow: View {
    let listing: Results
    
    var body: some View {
        HStack {
            if let thumbnailUrl = listing.imageUrlsThumbnails?.first, let url = URL(string: thumbnailUrl) {
                AsyncImage(url: url) { image in
                    image.resizable().aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            VStack(alignment: .leading) {
                Text(listing.name ?? "No name available").font(.headline)
                Text(listing.price ?? "No price available").font(.subheadline).foregroundColor(.gray)
            }
        }
    }
}


#Preview {
    ListingsView()
}
