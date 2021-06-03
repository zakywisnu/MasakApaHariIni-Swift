//
//  RecipeByCategoryRow.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 28/05/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecipeByCategoryRow: View {
    var recipeCategory: RecipeCategoryModel
    var body: some View {
        VStack(spacing: 0){
            WebImage(url: URL(string: recipeCategory.thumb))
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack{
                Spacer()
                RecipeItem(image: "timer", name: recipeCategory.times)
                Spacer()
                RecipeItem(image: "person.2", name: recipeCategory.portion)
                Spacer()
                RecipeItem(image: "wand.and.stars", name: recipeCategory.difficulty)
                Spacer()
            }
            .padding(.top, 8)
            .background(Color.black.opacity(0.05))
        }
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .frame(maxWidth: UIScreen.main.bounds.width - 32)
    }
}

struct RecipeByCategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        RecipeByCategoryRow(recipeCategory: RecipeCategoryModel(title: "Resep Tongkol Balado Hijau, Mantap Dijadikan Lauk atau Sambal", thumb: "https://www.masakapahariini.com/wp-content/uploads/2020/12/ikan-balado-hijau-400x240.jpg", key: "resep-tongkol-balado-hijau", times: "1jam", portion: "4 Porsi", difficulty: "Mudah"))
    }
}
