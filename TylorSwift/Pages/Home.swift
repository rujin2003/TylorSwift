//
//  Home.swift
//  TylorSwift
//
//  Created by Apple on 08/04/24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            TabView{
                HomePage().tabItem { Image(systemName: "music.note.house")}
                
                TylorSongs().tabItem { Image(systemName: "music.mic") .foregroundColor(.white)}
                
                SearchSong().tabItem { Image(systemName:
                                                "magnifyingglass") }
            }.onAppear{
                UITabBar.appearance().barTintColor = .white
                UITabBar.appearance().backgroundColor = .black
            }
        }
       
    }
}

#Preview {
    Home()
}
