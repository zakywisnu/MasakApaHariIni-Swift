//
//  Injection.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 24/05/21.
//

import Foundation
import RealmSwift

final class Injection: NSObject {
    private func provideRepository() -> FoodRecipesRepositoryProtocol {
        let realm = try? Realm()
        
        let remote: RemoteDataSource = RemoteDataSource.sharedInstance
        let local: LocalDataSource = LocalDataSource.sharedInstance(realm)
        return FoodRecipesRepository.sharedInstance(local,remote)
    }
    
    func provideRecipeCategory() -> RecipeCategoryUseCase {
        let repository = provideRepository()
        return RecipeCategoryInteractor(repository: repository)
    }
    
    func provideRecipeByCategory(by key: String) -> RecipeByCategoryUseCase {
        let repository = provideRepository()
        return RecipeByCategoryInteractor(by: key, repository: repository)
    }
    
    func provideRecipeDetail(by key: String) -> RecipeDetailUseCase{
        let repository = provideRepository()
        return RecipeDetailInteractor(by: key, repository: repository)
    }
    
    func provideArticleCategory() -> ArticleCategoryUseCase {
        let repository = provideRepository()
        return ArticleCategoryInteractor(repository: repository)
    }
    
    func provideArticleByCategory(by key: String) -> ArticleByCategoryUseCase {
        let repository = provideRepository()
        return ArticleByCategoryInteractor(by: key, repository: repository)
    }
    
    func provideArticleDetail(tag: String, key: String) -> ArticleDetailUseCase {
        let repository = provideRepository()
        return ArticleDetailInteractor(by: tag, by: key, repository: repository)
    }
    
    func provideSearch() -> SearchUseCase {
        let repository = provideRepository()
        return SearchInteractor(repository: repository)
    }
}
