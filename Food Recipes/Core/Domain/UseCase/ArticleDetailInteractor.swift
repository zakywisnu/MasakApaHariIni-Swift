//
//  ArticleDetailInteractor.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 27/05/21.
//

import Foundation
import Combine

protocol ArticleDetailUseCase {
    func getArticleDetail() -> AnyPublisher<ArticleDetailModel,Error>
}

class ArticleDetailInteractor: ArticleDetailUseCase {
    
    private let repository: FoodRecipesRepositoryProtocol
    private let key: String
    private let tag: String
    
    required init(by tag: String, by key: String, repository: FoodRecipesRepositoryProtocol) {
        self.repository = repository
        self.key = key
        self.tag = tag
    }
    func getArticleDetail() -> AnyPublisher<ArticleDetailModel, Error> {
        return repository.getArticleDetail(tag: tag, key: key)
    }
}
