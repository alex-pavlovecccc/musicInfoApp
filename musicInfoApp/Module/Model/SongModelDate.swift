//
//  SongModelDate.swift
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
    let wrapperType: WrapperType
    let kind: Kind?
    let artistID, collectionID, trackID: Int?
    let artistName: String
    let collectionName, trackName, collectionCensoredName, trackCensoredName: String?
    let artistViewURL, collectionViewURL, trackViewURL: String?
    let previewURL: String
    let artworkUrl30: String?
    let artworkUrl60, artworkUrl100: String
    let collectionPrice: Double
    let trackPrice, collectionHDPrice, trackHDPrice: Double?
    let releaseDate: Date
    let collectionExplicitness: Explicitness
    let trackExplicitness: Explicitness?
    let discCount, discNumber, trackCount, trackNumber: Int?
    let trackTimeMillis: Int?
    let country: Country
    let currency: Currency
    let primaryGenreName: String
    let contentAdvisoryRating, shortDescription, longDescription: String?
    let isStreamable: Bool?
    let collectionArtistName: String?
    let trackRentalPrice, trackHDRentalPrice: Double?
    let hasITunesExtras: Bool?
    let resultDescription: String?

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistID = "artistId"
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice
        case collectionHDPrice = "collectionHdPrice"
        case trackHDPrice = "trackHdPrice"
        case releaseDate, collectionExplicitness, trackExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, shortDescription, longDescription, isStreamable, collectionArtistName, trackRentalPrice
        case trackHDRentalPrice = "trackHdRentalPrice"
        case hasITunesExtras
        case resultDescription = "description"
    }
}

enum Explicitness: String, Codable {
    case cleaned = "cleaned"
    case explicit = "explicit"
    case notExplicit = "notExplicit"
}

enum Country: String, Codable {
    case usa = "USA"
}

enum Currency: String, Codable {
    case usd = "USD"
}

enum Kind: String, Codable {
    case featureMovie = "feature-movie"
    case song = "song"
    case tvEpisode = "tv-episode"
}

enum WrapperType: String, Codable, CaseIterable {
    case audiobook = "audiobook"
    case track = "track"
}
