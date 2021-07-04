//
//  Bookshelf.swift
//  simple book viewer
//
//  Created by Mitchell Salomon on 7/3/21.
//

import SwiftUI

struct Bookshelf: View {
    
    @State var model = BookModel()
    
    var body: some View {
        ScrollView {
            ForEach(1..<6) { i in
                BookPreview(book: model.books[i], coverImageID: i)
                
            }
            
        }
    }
    
}

struct Bookshelf_Previews: PreviewProvider {
    static var previews: some View {
        Bookshelf()
    }
}
