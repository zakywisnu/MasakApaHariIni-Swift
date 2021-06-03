//
//  ArticleByCategoryRouter.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 27/05/21.
//

import SwiftUI

class ArticleByCategoryRouter{
    
    func makeArticleDetailView(for article: ArticleCategoryModel) -> some View {
        let useCase = Injection.init().provideArticleDetail(tag: article.tags, key: article.key)
        let presenter = ArticleDetailPresenter(useCase: useCase)
        return ArticleDetailView(presenter: presenter)
    }
    
}
