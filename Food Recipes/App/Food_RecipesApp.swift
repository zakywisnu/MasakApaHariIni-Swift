//
//  Food_RecipesApp.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 23/04/21.
//

import SwiftUI

@main
struct Food_RecipesApp: App {
    
    @StateObject var recipeCategoryPresenter = RecipeCategoryPresenter(useCase: Injection.init().provideRecipeCategory())
    @StateObject var articleCategoryPresenter = ArticleCategoryPresenter(useCase: Injection.init().provideArticleCategory())
    @StateObject var searchPresenter = SearchPresenter(useCase: Injection.init().provideSearch())
    
    var body: some Scene {
        WindowGroup {
            ContentView(recipeCategoryPresenter: recipeCategoryPresenter, articleCategoryPresenter: articleCategoryPresenter, searchPresenter: searchPresenter)
        }
    }
}
