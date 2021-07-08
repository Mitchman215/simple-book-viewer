//
//  BookDetail.swift
//  simple book viewer
//
//  Created by Mitchell Salomon on 7/3/21.
//

import SwiftUI

struct BookDetail: View {
    
    @EnvironmentObject var model:BookModel
    var book:Book
    @State private var rating = 2
    
    var body: some View {
        
        VStack (spacing: 20) {
            
            VStack (spacing: 10) {
                Text("Read Now!")
                    .font(.title)
                    .accentColor(.black)
                Image("cover\(book.id)")
                    .resizable()
                    .scaledToFit()
            }
            
            Text("Mark for later")
                .font(.headline)
            
            Picker("Select rating", selection: $rating) {
                ForEach(1..<6) { i in
                    Text(String(i))
                        .tag(i)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        .onAppear(perform: {
            rating = book.rating
        })
        
    }
    
}

struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail(book: BookModel().books[1])
    }
}
