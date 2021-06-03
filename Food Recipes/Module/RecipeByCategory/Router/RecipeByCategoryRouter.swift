//
//  RecipeByCategoryRouter.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 28/05/21.
//

import Foundation
import SwiftUI

class RecipeByCategoryRouter {
    
    func makeRecipeDetailView(for category: RecipeCategoryModel) -> some View {
        let useCase = Injection.init().provideRecipeDetail(by: category.key)
        let presenter = RecipeDetailPresenter(useCase: useCase)
        return RecipeDetailView(presenter: presenter)
    }
    
}
