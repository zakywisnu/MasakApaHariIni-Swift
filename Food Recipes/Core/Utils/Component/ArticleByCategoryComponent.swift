//
//  ArticleByCategoryComponent.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 28/05/21.
//

import SwiftUI

struct ArticleByCategoryComponent: View{
    let image: String
    let name: String
    
    var body: some View {
        VStack {
            HStack{
                Image(systemName: image)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 8)
                Text(name)
                    .padding(.vertical, 8)
                    .padding(.trailing, 8)
            }
            .padding(.all, 8)
        }
        .background(Color.green)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
    }
}

struct ArticleByCategoryComponent_Previews: PreviewProvider {
    static var previews: some View {
        ArticleByCategoryComponent(image: "book.fill", name: "category")
    }
}
