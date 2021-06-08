//
//  RecipeItem.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 02/06/21.
//

import SwiftUI

struct RecipeItem: View {
    
    var image: String
    var name: String
    
    var body: some View {
        VStack{
            Image(systemName: image)
                .foregroundColor(.green)
                .padding(.bottom, 8)
                .font(.headline)
            
            Text(name)
                .font(.system(size: 10, weight: .bold, design: .default))
                .padding(.bottom, 16)
                .foregroundColor(.black)
                .frame(width: 50)
        }
    }
}

struct RecipeItem_Previews: PreviewProvider {
    static var previews: some View {
        RecipeItem(image: "book.fill", name: "category")
    }
}
