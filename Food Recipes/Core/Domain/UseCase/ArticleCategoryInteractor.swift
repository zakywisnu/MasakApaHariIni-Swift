//
//  ArticleCategoryInteractor.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 27/05/21.
//

import Foundation
import Combine

protocol ArticleCategoryUseCase {
    func getArticleCategory() -> AnyPublisher<[ArticleModel], Error>
}

class ArticleCategoryInteractor: ArticleCategoryUseCase {
    
    private let repository: FoodRecipesRepositoryProtocol
    
    required init(repository: FoodRecipesRepositoryProtocol) {
        self.repository = repository
    }
    
    func getArticleCategory() -> AnyPublisher<[ArticleModel], Error> {
        return repository.getArticleCategory()
    }
    
}
