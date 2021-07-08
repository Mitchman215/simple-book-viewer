//
//  Book.swift
//  simple book viewer
//
//  Created by Mitchell Salomon on 7/3/21.
//

import Foundation

class Book: Identifiable, Decodable {
    
    var id:Int
    var title:String
    var author:String
    var isFavorite:Bool
    var currentPage:Int
    var rating:Int
    var content:[String]
    
}
