//
//  SearchSong.swift
//  TylorSwift
//
//  Created by Apple on 08/04/24.
//

import SwiftUI

struct SearchSong: View {
    @State var  searchText: String = ""
    var body: some View {
        NavigationStack{
            
            VStack{
                
                HStack {
                TextField("Search", text: $searchText)
                                   .padding(10)
                                   .background(Color.white)
                                   .cornerRadius(8)
                                   .border(Color.black, width: 1)
                               
                               Button(action: {
                                  
                               }) {
                Image(systemName: "magnifyingglass")
                                       .foregroundColor(.black)
                                       .padding(10)
                                       .background(Color.white)
                                       .cornerRadius(8)
                                       .overlay(
                                           RoundedRectangle(cornerRadius: 5)
                                               .stroke(Color.black, lineWidth: 1)
                                       )
                               }
                           }
                .padding(.top,15).padding()
                // *****
                Spacer()
                
                
                
            }.navigationTitle("Search Songs.. 🎶").onAppear{
               
            }.foregroundColor(.white).onAppear{
                
                UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            }.background(Image("background"))
        }
        
    }
    private func formatSearchText(text : String)->String{
        let components = text.split(separator: " ")
            let modifiedString = components.joined(separator: "+")
            return modifiedString
    }
}

#Preview {
    SearchSong()
}
