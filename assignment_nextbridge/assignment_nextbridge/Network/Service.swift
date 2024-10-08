//
//  Service.swift
//  assignment_nextbridge
//
//  Created by Mehrooz Khan on 9/5/24.
//

import Foundation

class ListingsService {
    static let shared = ListingsService()
    private let urlString = "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/default/dynamodb-writer"
    
    func fetchListings() async throws -> Response {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        print(data)
        let listings = try JSONDecoder().decode(Response.self, from: data)
        return listings
    }
}
