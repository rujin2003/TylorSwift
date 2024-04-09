//
//  SongsItem.swift
//  TylorSwift
//
//  Created by Apple on 08/04/24.
//

import SwiftUI

struct SongsItem: View {

    
    private let shadowColor: Color = .init(red: 197/255, green: 197/255, blue: 197/255)
    @State var isliked : Bool = false
    var body: some View {
        HStack{
            HStack{}.frame(width: 50,height: 50).background(.blue).cornerRadius(5).padding()
            Text("Rujin Devkota ").bold()
            Text("~tylor swift").font(.system(size:12)).foregroundStyle(.gray)
            
            Spacer()
            if isliked {
                Image(systemName: "heart.fill").resizable().frame(width: 22,height: 20).foregroundColor(.red).padding().onTapGesture {
                    withAnimation(.bouncy){
                        isliked.toggle()
                    }
                }
            }else{
                Image(systemName: "heart").resizable().frame(width: 22,height: 20).padding().onTapGesture {
                    withAnimation(.bouncy){
                        isliked.toggle()
                    }
                }
            }
        }.frame(width: 350,height: 65) .cornerRadius(8) .background(Color.white.shadow(.drop(color: shadowColor, radius: 3, x: 3, y: 3)))

        
        
    }
}

#Preview {
    SongsItem()
}
