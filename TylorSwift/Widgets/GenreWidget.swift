//
//  GenreWidget.swift
//  TylorSwift
//
//  Created by Apple on 10/04/24.
//

import SwiftUI

struct GenreButton: View {
    let text: String
    @Binding var selectedGenre: String
    
    var body: some View {
        HStack {
            Text(text)
                .foregroundColor(selectedGenre == text ? .white : .black)
               
                .onTapGesture {
                    selectedGenre = text
            }
        } .frame(width: 50,height: 25).padding(8)
            .background(selectedGenre == text ?  Color(red: 215 / 255, green: 189 / 255, blue: 226 / 255) : Color.white)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct GenreWidget: View {
    @State private var selectedGenre: String = ""
    let genres = ["Pop", "Rock", "R & B", "Blues", "Jazz"]
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(genres, id: \.self) { genre in
                GenreButton(text: genre, selectedGenre: $selectedGenre)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GenreWidget()
    }
}
