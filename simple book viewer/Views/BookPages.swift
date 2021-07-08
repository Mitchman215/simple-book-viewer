//
//  BookPages.swift
//  simple book viewer
//
//  Created by Mitchell Salomon on 7/3/21.
//

import SwiftUI

struct BookPages: View {
    
    var book:Book
    @State private var page = 0
    
    var body: some View {
        TabView(selection: $page,
                content:  {
                    ForEach(book.content.indices) { index in
                        VStack {
                            Text(book.content[index])
                                .tag(index)
                            Spacer()
                            Text("Page \(index + 1)")
                        }
                        .padding()
                    }
                })
            .tabViewStyle(PageTabViewStyle())
        
    }
}

struct BookPages_Previews: PreviewProvider {
    static var previews: some View {
        BookPages(book: BookModel().books[0])
    }
}
