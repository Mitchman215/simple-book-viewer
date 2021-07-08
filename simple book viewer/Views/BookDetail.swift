//
//  BookDetail.swift
//  simple book viewer
//
//  Created by Mitchell Salomon on 7/3/21.
//

import SwiftUI

struct BookDetail: View {
    
    @EnvironmentObject var model: BookModel
    var book:Book
    @State private var rating = 2
    
    var body: some View {
        
        VStack (spacing: 20) {
            
            VStack (spacing: 10) {
                Text("Read Now!")
                    .font(.title)
                    .accentColor(.black)
                
                    NavigationLink(
                        destination: BookPages(book: book),
                        label: {
                            Image("cover\(book.id)")
                                .resizable()
                                .scaledToFit()
                        })
            }
            .padding()
            
            Text("Mark for later")
                .font(.headline)
            Button(action: {
                model.toggleFavorite(bookID: book.id)
            }, label: {
                Image(systemName: book.isFavorite ?
                    "star.fill" : "star")
                    .resizable()
                    .frame(width: 28, height: 28)
                    .foregroundColor(.yellow)
                    
            })
            
            Text("Rate \(book.title)")
            Picker("Select rating", selection: $rating) {
                ForEach(1..<6) { i in
                    Text(String(i))
                        .tag(i)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding([.horizontal, .bottom], 60)
        }
        .onAppear(perform: {
            rating = book.rating})
        .navigationBarTitle(book.title)
    }
    
}

struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail(book: BookModel().books[0])
            .environmentObject(BookModel())
    }
}
