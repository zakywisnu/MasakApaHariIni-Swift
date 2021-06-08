//
//  ArticleByCategoryView.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 27/05/21.
//

import SwiftUI

struct ArticleByCategoryView: View {
    @ObservedObject var presenter: ArticleByCategoryPresenter
    var body: some View {
        ZStack{
            if self.presenter.isLoading{
                loadingIndicator
            } else if self.presenter.isError{
                errorIndicator
            } else {
                content
            }
        }
        .onAppear{
            if self.presenter.article.count == 0 {
                self.presenter.getArticleByCategory()
            }
        }
        .navigationBarTitle(
            "Article"
        )
    }
}

extension ArticleByCategoryView{
    var loadingIndicator: some View {
        VStack{
            LottieView(filename: "food_loading")
        }
    }
    
    var errorIndicator: some View {
        VStack {
            LottieView(filename: "food_error")
        }
    }
    
    var content: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false){
                ForEach(
                    self.presenter.article,
                    id: \.key
                ) { articles in
                    ZStack{
                        self.presenter.linkBuilder(for: articles){
                            ArticleByCategoryRow(article: articles)
                        }
                    }
                }
            }
        }
    }
}
