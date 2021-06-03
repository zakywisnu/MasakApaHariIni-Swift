//
//  RecipeCategoryRouter.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 28/05/21.
//

import Foundation
import SwiftUI

class RecipeCategoryRouter{
    
    func makeRecipeByCategoryView(for recipe: CategoryModel) -> some View {
        let useCase = Injection.init().provideRecipeByCategory(by: recipe.key)
        let presenter = RecipeByCategoryPresenter(useCase: useCase)
        return RecipeByCategoryView(presenter: presenter)
        
    }
    
}
