//
//  BookPages.swift
//  simple book viewer
//
//  Created by Mitchell Salomon on 7/3/21.
//

import SwiftUI

struct BookPages: View {
    
    var book:Book
    @EnvironmentObject var model: BookModel
    @State private var page = 0
    
    var body: some View {
        TabView(selection: $page) {
            ForEach(book.content.indices) { index in
                VStack {
                    Text(book.content[index])
                        .tag(index)
                    
                    Spacer()
                    
                    Text("\(index + 1)")
                }
            }
            .padding()
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        .onChange(of: page, perform: { pg in
            model.changePage(bookID: book.id, newPage: pg)
        })
        .onAppear() {
            page = book.currentPage
        }
        
    }
}

struct BookPages_Previews: PreviewProvider {
    static var previews: some View {
        BookPages(book: BookModel().books[0])
            .environmentObject(BookModel())
    }
}
