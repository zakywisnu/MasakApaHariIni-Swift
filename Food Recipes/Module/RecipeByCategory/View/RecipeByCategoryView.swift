//
//  RecipeByCategoryView.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 28/05/21.
//

import SwiftUI
import RealmSwift

struct RecipeByCategoryView: View {
    
    @ObservedObject var presenter: RecipeByCategoryPresenter
    
    var body: some View {
        ZStack{
            if self.presenter.isLoading{
                loadingIndicator
            } else if self.presenter.isError {
                errorIndicator
            } else {
                content
            }
        }
        .onAppear{
            if self.presenter.categories.count == 0 {
                self.presenter.getRecipeByCategory()
            }
        }
        .navigationBarTitle(
            "Recipes"
        )
    }
}

extension RecipeByCategoryView {
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
                    self.presenter.categories,
                    id: \.key
                ) { categories in
                    ZStack{
                        self.presenter.linkBuilder(for: categories){
                            RecipeByCategoryRow(recipeCategory: categories)
                        }
                    }
                }
            }
        }
    }
}

struct RecipeByCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeByCategoryView(presenter: Injection.init().provideRecipeByCategory(by: "masakan-hari-raya") as! RecipeByCategoryPresenter)
    }
}
 
