//
//  UserModel.swift
//  TylorSwift
//
//  Created by Apple on 09/04/24.
//

import Foundation
import SwiftData


@Model
class HistoryModel{
    var id =  UUID()
    var Artistname : String
    var date : Date
    
    init(name: String, date: Date) {
        self.Artistname = name
        self.date = date
        
    }
}

