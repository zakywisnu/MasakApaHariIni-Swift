//
//  ArticleByCategoryInteractor.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 27/05/21.
//

import Foundation
import Combine

protocol ArticleByCategoryUseCase {
    func getArticleByCategory() -> AnyPublisher<[ArticleCategoryModel],Error>
}

class ArticleByCategoryInteractor: ArticleByCategoryUseCase{
    
    private let repository: FoodRecipesRepositoryProtocol
    private let key: String
    
    required init(by key: String, repository: FoodRecipesRepositoryProtocol) {
        self.repository = repository
        self.key = key
    }
    
    func getArticleByCategory() -> AnyPublisher<[ArticleCategoryModel], Error> {
        return repository.getArticleByCategory(key: key)
    }
}
