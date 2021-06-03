//
//  RecipeCategoryView.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 28/05/21.
//

import SwiftUI

struct RecipeCategoryView: View {
    
    @ObservedObject var presenter: RecipeCategoryPresenter
  
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
            if self.presenter.category.count == 0{
                self.presenter.getRecipeCategory()
            }
        }
        .navigationBarTitle(
            "Category",
            displayMode: .automatic
        )
    }
}

extension RecipeCategoryView {
    var loadingIndicator: some View {
        VStack{
            LottieView(filename: "food_loading.json")
        }
    }
    
    var errorIndicator: some View {
        VStack {
            LottieView(filename: "food_error.json")
        }
    }
    
    var content: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false){
                ForEach(
                    self.presenter.category,
                    id: \.key
                ) { categories in
                    ZStack(alignment: .leading){
                        self.presenter.linkBuilder(for: categories) {
                            RecipeCategoryRow(category: categories)
                        }
                    }
                    .padding(.top, 10)
                }
            }
        }
    }
}

//                LazyVGrid(columns: columns, spacing: 10){
//                    ForEach(
//                        self.presenter.category,
//                        id: \.key
//                    ) { categories in
//                        ZStack {
//                            self.presenter.linkBuilder(for: categories) {
//                                RecipeCategoryRow(category: categories)
//                            }
//                        }.padding()
//                    }
//                }
