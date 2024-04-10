//
//  SwiftUIView.swift
//  TylorSwift
//
//  Created by Apple on 09/04/24.
//

import SwiftUI
import SwiftData

struct SongsItem: View {
    var itemData : Songs
    @State var isliked : Bool = false
   
    @Query(sort: \LikedSongsW.name) var likedsongs : [LikedSongsW] = []

    @StateObject var imageLoader = ImageDownloadViewModel()
   
    @Environment(\.modelContext) var context
    @State var imageData : Data?
    
    var body: some View {
        HStack {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .cornerRadius(15)
                    .padding(15)
            } else {
                Image("sampleimage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .cornerRadius(15)
                    .padding(15)
            }
            
            VStack(alignment:.leading){
                Text(itemData.trackName ?? "")
                    .lineLimit(1)
                    .bold()
                    .font(.system(size: 22))
                    .padding(.bottom, 2)
                    .padding(.top, 12)
                
                HStack {
                    Text("~ \(itemData.artistName ?? "")")
                    Spacer()
                    Text("$\(itemData.trackPrice ?? 0.0)")
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                }
                .padding([.top, .leading], 2)
                
                HStack {
                    if isliked{
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 22, height: 20)
                            .foregroundColor(.red)
                            .padding()
                            .onTapGesture {
                         
                           let delItem = LikedSongsW(name: itemData.trackName!,artistName: itemData.artistName!, image: imageData)
                        context.delete(delItem)
                                        
                            
                                
                                
                                withAnimation(.bouncy){
                                    isliked.toggle()
                                }
                            }
                    } else {
                       
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 25, height: 23)
                            .padding()
                            .onTapGesture {
                              
                                imageData = imageLoader.image?.pngData()
                                    context.insert(LikedSongsW(name: itemData.trackName! , artistName: itemData.artistName!, image: imageData ))
                                
                             
                              
                                withAnimation(.bouncy){
                                    isliked.toggle()
                                }
                            }
                    }
                    
                    Button {
                        // Add action for share button
                    } label: {
                        Image(systemName: "square.and.arrow.up.circle.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color(red: 187/255, green: 143/255, blue: 206/255))
                    }
                }
                .padding(8)
            }
            .padding(.top, 5)
            
            Spacer()
        }
        .frame(width: 350, height: 150)
        .background(Color.white.shadow(.drop(radius: 10)))
        .onAppear {
            if(likedsongs.contains(where:{$0.name == itemData.trackName})){
                isliked = true
            }
            Task {
                await imageLoader.fetchImage(url: itemData.artworkUrl100 ?? itemData.artworkUrl30 ?? itemData.artworkUrl60 ?? "dummy image")
            }
        }
    }

}


