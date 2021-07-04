//
//  BookDetail.swift
//  simple book viewer
//
//  Created by Mitchell Salomon on 7/3/21.
//

import SwiftUI

struct BookDetail: View {
    
    var book:Book
    
    var body: some View {
        
        VStack {
            
            
        }
    }
}

struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail(book: BookModel().books[0])
    }
}
