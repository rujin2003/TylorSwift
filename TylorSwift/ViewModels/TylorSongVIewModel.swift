//
//  TylorSongVIewModel.swift
//  TylorSwift
//
//  Created by Apple on 08/04/24.
//

import Foundation
class TylorSong: ObservableObject{
    @Published var songs : SongsModel = SongsModel(resultCount: 0, results: [])
    
    
   func  fetchTylorData()async{
       Task{
          songs =  try await  NetworkData.shared.getAlbumData(ourl: "https://itunes.apple.com/search?term=Taylor+Swift&entity=song&limit=5") ?? SongsModel(resultCount: 0, results: [])
           
       }
    }
}
