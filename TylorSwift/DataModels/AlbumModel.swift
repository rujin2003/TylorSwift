//
//  AlbumModel.swift
//  TylorSwift
//
//  Created by Apple on 08/04/24.
//


import Foundation


//https://itunes.apple.com/search?term=Taylor+Swift&entity=album&limit=7
//https://itunes.apple.com/search?term=Taylor+Swifton&entity=song&limit=5


struct AlbumModelList: Codable {
    let resultCount: Int
    let results: [AlbumModel]
}


struct AlbumModel: Codable {
    let wrapperType: WrapperType
    let collectionType: CollectionType
    let artistID, collectionID: Int?
    let amgArtistID: Int?
    let artistName, collectionName, collectionCensoredName: String?
    let artistViewURL, collectionViewURL: String?
    let artworkUrl60, artworkUrl100: String?
    let collectionPrice: Double?
    let collectionExplicitness: CollectionExplicitness?
    let trackCount: Int?
    let copyright: String?
    let country: Country?
    let currency: Currency?
    let releaseDate: Date?
    let primaryGenreName: String?
    let contentAdvisoryRating: String?

    enum CodingKeys: String, CodingKey {
        case wrapperType, collectionType
        case artistID = "artistId"
        case collectionID = "collectionId"
        case amgArtistID = "amgArtistId"
        case artistName, collectionName, collectionCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case artworkUrl60, artworkUrl100, collectionPrice, collectionExplicitness, trackCount, copyright, country, currency, releaseDate, primaryGenreName, contentAdvisoryRating
    }
}

enum CollectionExplicitness: String, Codable {
    case explicit = "explicit"
    case notExplicit = "notExplicit"
}

enum CollectionType: String, Codable {
    case album = "Album"
}

enum Country: String, Codable {
    case usa = "USA"
}

enum Currency: String, Codable {
    case usd = "USD"
}

enum WrapperType: String, Codable {
    case collection = "collection"
}


