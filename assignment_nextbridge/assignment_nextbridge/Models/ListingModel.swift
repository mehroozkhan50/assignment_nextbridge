//
//  ListingModel.swift
//  assignment_nextbridge
//
//  Created by Mehrooz Khan on 9/5/24.
//

import Foundation


struct Response: Codable {
    let results: [Results]
    let pagination: Pagination
}

struct Results: Codable, Identifiable {
    let createdAt: String?
    let price: String?
    let name: String?
    let uid: String? // This is used as the 'id' field
    let imageIds: [String]?
    let imageUrls: [String]?
    let imageUrlsThumbnails: [String]?

    var id: String { // SwiftUI List requires `Identifiable` conformance
        return uid ?? UUID().uuidString
    }

    // Codable keys for parsing
    private enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case price
        case name
        case uid
        case imageIds = "image_ids"
        case imageUrls = "image_urls"
        case imageUrlsThumbnails = "image_urls_thumbnails"
    }
}

struct Pagination: Codable {
    let key: String?
}
