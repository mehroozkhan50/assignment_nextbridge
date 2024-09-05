//
//  ListingModel.swift
//  assignment_nextbridge
//
//  Created by Mehrooz Khan on 9/5/24.
//

import Foundation

struct Listing: Identifiable, Codable {
    let id: String
    let title: String
    let price: String
    let image: String
    let description: String
}
