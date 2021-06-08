//
//  SearchRouter.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 30/05/21.
//

import Foundation
import SwiftUI

class SearchRouter{
    
    func makeDetailView(for search: SearchModel) -> some View {
        let useCase = Injection.init().provideRecipeDetail(by: search.key)
        let presenter = RecipeDetailPresenter(useCase: useCase)
        return RecipeDetailView(presenter: presenter)
    }
    
}
