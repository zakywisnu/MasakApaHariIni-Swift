//
//  RecipeCategoryInteractor.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 27/05/21.
//

import Foundation
import Combine

protocol RecipeCategoryUseCase {
    func getRecipeCategory() -> AnyPublisher<[CategoryModel],Error>
}

class RecipeCategoryInteractor: RecipeCategoryUseCase {
    
    private let repository: FoodRecipesRepositoryProtocol
    
    required init(repository: FoodRecipesRepositoryProtocol) {
        self.repository = repository
    }
    
    func getRecipeCategory() -> AnyPublisher<[CategoryModel], Error> {
        return repository.getRecipeCategory()
    }
}
