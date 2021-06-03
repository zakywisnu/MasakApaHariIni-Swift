//
//  RecipeDetailView.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 29/05/21.
//

import SwiftUI

struct RecipeDetailView: View {
    @ObservedObject var presenter: RecipeDetailPresenter
    var body: some View {
        Text("Detail Recipe")
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(presenter: RecipeDetailPresenter(useCase: Injection.init().provideRecipeDetail(by: "asd")))
    }
}
