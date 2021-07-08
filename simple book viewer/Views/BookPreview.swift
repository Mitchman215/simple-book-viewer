//
//  BookPreview.swift
//  simple book viewer
//
//  Created by Mitchell Salomon on 7/4/21.
//

import SwiftUI

struct BookPreview: View {
    
    var book:Book
    
    var body: some View {
        
        ZStack (alignment: .leading) {
            // creates background shadow
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(15)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: 5)
            
            VStack (alignment: .leading) {
                HStack {
                    Text(book.title)
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                    
                    if book.isFavourite {
                        Image(systemName: "star.fill")
                            .resizable()
                            .foregroundColor(.yellow)
                            .scaledToFill()
                            .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                    }
                    
                }
                
                
                Text(book.author)
                    .italic()
                
                Image("cover" + String(book.id))
                    .resizable()
                    .scaledToFit()
                
            }
            .padding()
        }
    }
}

struct BookPreview_Previews: PreviewProvider {
    static var previews: some View {
        BookPreview(book: BookModel().books[0])
    }
}
