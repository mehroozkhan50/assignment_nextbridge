//
//  ListingViewModel.swift
//  assignment_nextbridge
//
//  Created by Mehrooz Khan on 9/5/24.
//

import Foundation
import Combine

import Foundation
import Combine

class ListingsViewModel: ObservableObject {
    @Published var listings: [Results] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func loadListings() {
        isLoading = true
        Task {
            do {
                let data = try await ListingsService.shared.fetchListings()
                DispatchQueue.main.async {
                    self.listings = data.results
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to load listings"
                    self.isLoading = false
                }
            }
        }
    }
}
