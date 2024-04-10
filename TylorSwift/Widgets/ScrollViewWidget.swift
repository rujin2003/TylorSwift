//
//  ScrollViewWidget.swift
//  TylorSwift
//
//  Created by Apple on 10/04/24.
//

import SwiftUI

struct ScrollViewWidget: View {
    var itemData : AlbumModel
    @StateObject var imageLoader = ImageDownloadViewModel()
    var body: some View {
        if let image = imageLoader.image{
            VStack{
                Image (uiImage:image)
                    . resizable()
                    . cornerRadius (15)
                    .frame(width: 150,
                           height: 150).shadow (radius: 10, y: 10)
                
                Text("\(itemData.collectionName ?? " ")").bold().lineLimit(1)
                
            }.frame(width: 150, height: 170)
            
           
        }else{
            Image ("sampleimage")
                . resizable()
                . cornerRadius (15)
                .frame(width: 150,
                       height: 150).shadow (radius: 10, y: 10).onAppear{
                    Task {
                        await imageLoader.fetchImage(url: itemData.artworkUrl100 ??  itemData.artworkUrl60 ?? "dummy image")
                    }
                }
        }
        
    }
}


