//
//  RecipeCategoryRow.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 27/05/21.
//

import SwiftUI

struct RecipeCategoryRow: View {
    var category: CategoryModel
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(category.category)
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundColor(.black)
            Divider()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .frame(height: 40)
    }
}

struct RecipeCategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCategoryRow(category: CategoryModel(category: "halo", key: "123"))
    }
}
