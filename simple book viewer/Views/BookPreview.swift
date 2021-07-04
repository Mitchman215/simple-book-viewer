//
//  BookPreview.swift
//  simple book viewer
//
//  Created by Mitchell Salomon on 7/4/21.
//

import SwiftUI

struct BookPreview: View {
    
    var book:Book
    var coverImageID:Int
    
    var body: some View {
        
        ZStack (alignment: .leading) {
            // creates background shadow
            Rectangle()
                .foregroundColor(.white)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: 5)
            
            VStack (alignment: .leading) {
                Text(book.title)
                    .font(.largeTitle)
                    .bold()
                
                
                Text(book.author)
                    .italic()
                
                Image("cover" + String(coverImageID))
                    .resizable()
                    .scaledToFit()
                
            }
            .padding()
        }
    }
}

struct BookPreview_Previews: PreviewProvider {
    static var previews: some View {
        BookPreview(book: BookModel().books[0],  coverImageID: 1)
    }
}
