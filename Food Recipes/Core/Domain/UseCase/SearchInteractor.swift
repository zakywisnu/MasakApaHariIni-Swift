//
//  SearchInteractor.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 27/05/21.
//

import Foundation
import Combine

protocol SearchUseCase {
    func getSearchRecipe(query: String) -> AnyPublisher<[SearchModel],Error>
}

class SearchInteractor: SearchUseCase {
    
    private let repository: FoodRecipesRepositoryProtocol
    
    required init(repository: FoodRecipesRepositoryProtocol) {
        self.repository = repository
    }
    func getSearchRecipe(query: String) -> AnyPublisher<[SearchModel], Error> {
        return repository.getSearchRecipe(query: query)
    }
    
    
}
