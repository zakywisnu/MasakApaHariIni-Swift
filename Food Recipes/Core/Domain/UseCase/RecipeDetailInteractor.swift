//
//  RecipeDetailInteractor.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 27/05/21.
//

import Foundation
import Combine

protocol RecipeDetailUseCase {
    func getRecipeDetail() -> AnyPublisher<RecipeDetailModel, Error>
}

class RecipeDetailInteractor: RecipeDetailUseCase {
    
    private let repository: FoodRecipesRepositoryProtocol
    private let key: String
    
    required init(by key: String, repository: FoodRecipesRepositoryProtocol) {
        self.repository = repository
        self.key = key
    }
    func getRecipeDetail() -> AnyPublisher<RecipeDetailModel, Error> {
        return repository.getRecipeDetail(key: key)
    }

}
