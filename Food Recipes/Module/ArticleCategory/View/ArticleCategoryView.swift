//
//  ArticleCategoryView.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 27/05/21.
//

import SwiftUI

struct ArticleCategoryView: View {
    
    @ObservedObject var presenter: ArticleCategoryPresenter
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    var body: some View {
        ZStack{
            if presenter.isLoading {
                loadingIndicator
            } else if presenter.isError {
                errorIndicator
            } else {
                content
            }
        }.onAppear{
            if self.presenter.article.count == 0 {
                self.presenter.getCategory()
            }
        }.navigationBarTitle(
            "Category",
            displayMode: .automatic
        )
    }
}

extension ArticleCategoryView {
    var loadingIndicator: some View {
        VStack {
            LottieView(filename: "food_loading.json")
        }
    }
    
    var errorIndicator: some View {
        VStack{
            LottieView(filename: "food_error.json")
        }
    }
    
    var content: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                ScrollView(.vertical, showsIndicators: false){
                    ForEach(
                        self.presenter.article,
                        id: \.key
                    ) { categories in
                        ZStack(alignment: .leading){
                            self.presenter.linkBuilder(for: categories) {
                                ArticleCategoryRow(article: categories)
                            }
                        }
                        .padding(.top, 10)
                    }
                }
            }
        }
    }
}
