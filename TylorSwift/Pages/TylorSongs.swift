//
//  TylorSongs.swift
//  TylorSwift
//
//  Created by Apple on 08/04/24.
//

import SwiftUI

struct TylorSongs: View {
    @ObservedObject var data = TylorSong()
    var body: some View {
       NavigationStack {
            VStack{
                ForEach($data.songs.results,id:\.id) { item in
                   SongsItem()
                            }
               
            }.background(Image("background")).navigationTitle("Tylors Song 👩🏻‍🎤").onAppear{
                UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
                }.onAppear{
                    Task{
                       await  data.fetchTylorData()
                        }
                    
                    
                }
    
        }
    }
}

#Preview {
    TylorSongs()
}
