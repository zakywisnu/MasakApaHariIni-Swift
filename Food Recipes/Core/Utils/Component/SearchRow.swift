//
//  SearchRow.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 04/06/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchRow: View {
    
    var search: SearchModel
    
    var body: some View {
        VStack(alignment: .leading,spacing: 0){
            WebImage(url: URL(string: search.thumb))
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(search.title)
                .font(.footnote)
                .padding(.horizontal, 16)
                .padding(.top, 10)
                .foregroundColor(.black)
                
            HStack{
                Spacer()
                RecipeItem(image: "timer", name: search.times)
                Spacer()
                RecipeItem(image: "person.2", name: search.serving)
                Spacer()
                RecipeItem(image: "wand.and.stars", name: search.difficulty)
                Spacer()
            }
            .padding(.top, 8)
        }
        .background(Color.black.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .frame(maxWidth: UIScreen.main.bounds.width - 32)
    }
}
