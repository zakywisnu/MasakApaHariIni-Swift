//
//  ContentView.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 23/04/21.
//

import SwiftUI

struct ContentView: View {
    let recipeCategoryPresenter: RecipeCategoryPresenter
    let articleCategoryPresenter: ArticleCategoryPresenter
    let searchPresenter: SearchPresenter
    var body: some View {
        TabView{
            NavigationView{
                RecipeCategoryView(presenter: recipeCategoryPresenter)
            }.tabItem {
                TabItem(imageName: "book.fill", title: "Recipe")
            }
            
            NavigationView{
                ArticleCategoryView(presenter: articleCategoryPresenter)
            }.tabItem {
                TabItem(imageName: "doc.plaintext.fill", title: "Article")
            }
            
            NavigationView{
                SearchView(presenter: searchPresenter)
            }.tabItem {
                TabItem(imageName: "magnifyingglass", title: "Search")
            }
        }
    }
}
