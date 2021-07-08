//
//  Bookshelf.swift
//  simple book viewer
//
//  Created by Mitchell Salomon on 7/3/21.
//

import SwiftUI

struct Bookshelf: View {
    
    @EnvironmentObject var model:BookModel
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                ScrollView {
                    LazyVStack {
                        ForEach(model.books) { bk in
                            NavigationLink(
                                destination: BookDetail(book: bk),
                                label: {
                                    BookPreview(book: bk)
                                        .frame(width: geo.size.width-20, height: geo.size.height - 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.black)
                                })
                        }
                    }
                    
                }
                .navigationTitle("My Library")
            }
        }
    }
    
}

struct Bookshelf_Previews: PreviewProvider {
    static var previews: some View {
        Bookshelf()
            .environmentObject(BookModel())
    }
}
