//
//  RecipeByCategoryInteractor.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 27/05/21.
//

import Foundation
import Combine

protocol RecipeByCategoryUseCase {
    func getRecipeByCategory() -> AnyPublisher<[RecipeCategoryModel],Error>
}

class RecipeByCategoryInteractor: RecipeByCategoryUseCase {

    
    private let repository: FoodRecipesRepositoryProtocol
    private let key: String
    
    required init(by key: String, repository: FoodRecipesRepositoryProtocol) {
        self.repository = repository
        self.key = key
    }
    
    func getRecipeByCategory() -> AnyPublisher<[RecipeCategoryModel], Error> {
        return repository.getRecipeByCategory(key: key)
    }
    
}
