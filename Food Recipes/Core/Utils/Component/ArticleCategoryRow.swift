//
//  ArticleCategoryRow.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 27/05/21.
//

import SwiftUI

struct ArticleCategoryRow: View {
    var article: ArticleModel
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(article.title)
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundColor(.black)
            Divider()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .frame(height: 40)
    }
}

struct ArticleCategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCategoryRow(article: ArticleModel(title: "articleku", key: "123"))
    }
}
