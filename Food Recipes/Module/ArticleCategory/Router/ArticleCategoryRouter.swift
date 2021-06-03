//
//  ArticleCategoryRouter.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 27/05/21.
//

import SwiftUI

class ArticleCategoryRouter {
    func makeArticleByCategoryView(for article: ArticleModel) -> some View {
        let useCase = Injection.init().provideArticleByCategory(by: article.key)
        let presenter = ArticleByCategoryPresenter(useCase: useCase)
        return ArticleByCategoryView(presenter: presenter)
    }
}
