//
//  NetworkData.swift
//  TylorSwift
//
//  Created by Apple on 08/04/24.
//

import Foundation
class NetworkData {
    static let shared = NetworkData()
    // using generics for both albums and songs type
    // network call is reuseable for all model type and all urls
    
    //https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=7
    //https://itunes.apple.com/search?term=jack+johnson&entity=song&limit=2
    
    func getAlbumData<T: Codable>(ourl: String) async throws -> T? {
        guard let url = URL(string: ourl) else {
            print("URL ERROR!")
            return nil
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            return decodedResponse
        } catch {
            print("Decoding Error: \(error)")
            return nil
        }
    }

}
