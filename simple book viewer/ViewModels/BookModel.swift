//
//  BookModel.swift
//  simple book viewer
//
//  Created by Mitchell Salomon on 7/3/21.
//

import Foundation

class BookModel: ObservableObject {
    
    @Published var books = [Book]()
    
    init () {
        // decodes local json data
        
        // get url path string to json file
        let pathString = Bundle.main.path(forResource: "Data", ofType: "json")
        
        // protects if pathString is nil
        if let path = pathString {
            // create url object
            let url = URL(fileURLWithPath: path)
            
            do {
                // create data object
                let data = try Data(contentsOf: url)
                // create json decoder
                let decoder = JSONDecoder()
                
                do{
                    books = try decoder.decode([Book].self, from: data)
                } catch {
                    // error using json decoder (json not properly formatted)
                    print(error)
                }
                
            } catch {
                // error creating data object
                print(error)
            }
            
        }
        
    }
    
    func toggleFavorite(bookID:Int) {
        if let index = books.firstIndex(where: { $0.id == bookID }) {
            books[index].isFavorite.toggle()
            let temp = books[index]
            books.remove(at: index)
            books.insert(temp, at: index)
        }
    }
    
    
}
