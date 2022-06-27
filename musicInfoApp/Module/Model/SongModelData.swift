//
//  SongModelData.swift
//  musicInfoApp
//
//  Created by Alexander Pavlovets on 24.06.2022.
//

import UIKit

//MARK: - Response
struct SearchResponse: Codable {
    let resultCount: Int
    let results: [Song]
}

// MARK: - Result
struct Song: Codable {
    var artistName: String?
    var collectionName: String?
    var trackName: String?
    var artworkUrl100: URL?
    var previewUrl: String?
    var primaryGenreName: String?
    var trackTimeMillis: Int?
    var trackId: Int?
    var largeImage: URL?

    enum CodingKeys: String, CodingKey {
        case artistName = "artistName"
        case collectionName = "collectionName"
        case trackName = "trackName"
        case artworkUrl100 = "artworkUrl100"
        case previewUrl = "previewUrl"
        case primaryGenreName = "primaryGenreName"
        case trackTimeMillis = "trackTimeMillis"
        case trackId = "trackId"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.artistName = try container.decode(String.self, forKey: .artistName)
        self.collectionName = try container.decode(String.self, forKey: .collectionName)
        self.trackName = try container.decode(String.self, forKey: .trackName)
        self.previewUrl = try container.decode(String.self, forKey: .previewUrl)
        self.primaryGenreName = try container.decode(String.self, forKey: .primaryGenreName)
        self.trackTimeMillis = try container.decode(Int.self, forKey: .trackTimeMillis)
        self.trackId = try container.decode(Int.self, forKey: .trackId)
        if let imageString = try? container.decode(String.self, forKey: .artworkUrl100 ) {
            let largeImage = imageString.replacingOccurrences(of: "100x100", with: "300x300")
            self.artworkUrl100 = URL(string: largeImage)
        }
    }
}

