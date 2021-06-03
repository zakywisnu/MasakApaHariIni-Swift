//
//  FoodRecipesRepository.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 23/04/21.
//

import Foundation
import Combine

protocol FoodRecipesRepositoryProtocol: AnyObject {
    func getRecipeCategory() -> AnyPublisher<[CategoryModel], Error>
    func getRecipeByCategory(key: String) -> AnyPublisher<[RecipeCategoryModel], Error>
    func getRecipeDetail(key: String) -> AnyPublisher<RecipeDetailModel, Error>
    func getArticleCategory() -> AnyPublisher<[ArticleModel],Error>
    func getArticleByCategory(key: String) -> AnyPublisher<[ArticleCategoryModel], Error>
    func getArticleDetail(tag: String, key: String) -> AnyPublisher<ArticleDetailModel,Error>
    func getSearchRecipe(query: String) -> AnyPublisher<[SearchModel], Error>
}

final class FoodRecipesRepository: NSObject {
    typealias FoodRecipesInstance = (LocalDataSource, RemoteDataSource) -> FoodRecipesRepository
    
    fileprivate let remote: RemoteDataSource
    fileprivate let local: LocalDataSource
    
    private init(remote: RemoteDataSource, local: LocalDataSource) {
        self.remote = remote
        self.local = local
    }
    
    static let sharedInstance: FoodRecipesInstance = { localRepo, remoteRepo in
        return FoodRecipesRepository(remote: remoteRepo, local: localRepo)
    }
}

extension FoodRecipesRepository: FoodRecipesRepositoryProtocol {
    func getRecipeCategory() -> AnyPublisher<[CategoryModel], Error> {
        return self.local.getCategoryRecipe()
            .flatMap{ result -> AnyPublisher<[CategoryModel], Error> in
                if result.isEmpty {
                    return self.remote.getCategory()
                        .map{ RecipeMapper.mapRecipeCategoryResponseToEntity(input: $0)}
                        .catch{ _ in self.local.getCategoryRecipe()}
                        .flatMap{ self.local.addCategoryRecipe(from: $0)}
                        .filter{ $0 }
                        .flatMap{ _ in self.local.getCategoryRecipe()
                            .map{ RecipeMapper.mapRecipeCategoryEntityToDomain(input: $0)}
                        }
                        .eraseToAnyPublisher()
                } else {
                    return self.local.getCategoryRecipe()
                        .map{ RecipeMapper.mapRecipeCategoryEntityToDomain(input: $0)}
                        .eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
    
    func getRecipeByCategory(key: String) -> AnyPublisher<[RecipeCategoryModel], Error> {
        return self.local.getRecipeByCategory(key: key)
            .flatMap{ result -> AnyPublisher<[RecipeCategoryModel], Error> in
                if result.isEmpty {
                    return self.remote.getRecipeCategory(key: key)
                        .map{ RecipeMapper.mapRecipeByCategoryResponseToEntity(input: $0)}
                        .catch{ _ in self.local.getRecipeByCategory(key: key)}
                        .flatMap{ self.local.addRecipeByCategory(from: $0)}
                        .filter{$0}
                        .flatMap{ _ in self.local.getRecipeByCategory(key: key)
                            .map{RecipeMapper.mapRecipeByCategoryEntityToDomain(input: $0)}
                        }
                        .eraseToAnyPublisher()
                } else {
                    return self.local.getRecipeByCategory(key: key)
                        .map{ RecipeMapper.mapRecipeByCategoryEntityToDomain(input: $0)}
                        .eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
    
    func getRecipeDetail(key: String) -> AnyPublisher<RecipeDetailModel, Error> {
        return self.local.getRecipeDetail(key: key)
            .flatMap{ result -> AnyPublisher<RecipeDetailModel, Error> in
                if result.ingredients.isEmpty{
                    return self.remote.getRecipeDetail(key: key)
                        .map{ RecipeMapper.mapRecipeDetailResponseToEntity(input: $0)}
                        .catch{ _ in self.local.getRecipeDetail(key: key)}
                        .flatMap{ self.local.addRecipeDetail(from: $0)}
                        .filter{$0}
                        .flatMap{ _ in self.local.getRecipeDetail(key: key)
                            .map{ RecipeMapper.mapRecipeDetailEntityToDomain(input: $0)}
                        }
                        .eraseToAnyPublisher()
                } else {
                    return self.local.getRecipeDetail(key: key)
                        .map{ RecipeMapper.mapRecipeDetailEntityToDomain(input: $0)}
                        .eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
    
    func getArticleCategory() -> AnyPublisher<[ArticleModel], Error> {
        return self.local.getCategoryArticle()
            .flatMap{ result -> AnyPublisher<[ArticleModel], Error> in
                if result.isEmpty {
                    return self.remote.getArticle()
                        .map{ ArticleMapper.mapCategoryArticleResponseToEntity(input: $0)}
                        .catch{ _ in self.local.getCategoryArticle()}
                        .flatMap{ self.local.addCategoryArticle(from: $0)}
                        .filter{$0}
                        .flatMap{ _ in self.local.getCategoryArticle()
                            .map {ArticleMapper.mapCategoryArticleEntityToDomain(input: $0)}
                        }
                        .eraseToAnyPublisher()
                } else {
                    return self.local.getCategoryArticle()
                        .map{ArticleMapper.mapCategoryArticleEntityToDomain(input: $0)}
                        .eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
    
    func getArticleByCategory(key: String) -> AnyPublisher<[ArticleCategoryModel], Error> {
        return self.local.getArticleByCategory(key: key)
            .flatMap{ result -> AnyPublisher<[ArticleCategoryModel], Error> in
                if result.isEmpty {
                    return self.remote.getArticleCategory(key: key)
                        .map{ ArticleMapper.mapArticleByCategoryResponseToEntity(input: $0)}
                        .catch{ _ in self.local.getArticleByCategory(key: key)}
                        .flatMap{ self.local.addArticleByCategory(from: $0)}
                        .filter{$0}
                        .flatMap{ _ in self.local.getArticleByCategory(key: key)
                            .map{ArticleMapper.mapArticleByCategoryEntityToDomain(input: $0)}
                        }
                        .eraseToAnyPublisher()
                } else {
                    return self.local.getArticleByCategory(key: key)
                        .map{ArticleMapper.mapArticleByCategoryEntityToDomain(input: $0)}
                        .eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
    
    func getArticleDetail(tag: String, key: String) -> AnyPublisher<ArticleDetailModel, Error> {
        return self.local.getArticleDetail(tag: tag, key: key)
            .flatMap{ result -> AnyPublisher<ArticleDetailModel, Error> in
                if result.title.isEmpty {
                    return self.remote.getArticleDetail(tag: tag, key: key)
                        .map { ArticleMapper.mapArticleDetailResponseToEntity(input: $0)}
                        .catch { _ in self.local.getArticleDetail(tag: tag, key: key)}
                        .flatMap{ self.local.addArticleDetail(from: $0)}
                        .filter{$0}
                        .flatMap{ _ in self.local.getArticleDetail(tag: tag, key: key)
                            .map{ArticleMapper.mapArticleDetailEntityToDomain(input: $0)}
                        }
                        .eraseToAnyPublisher()
                } else {
                    return self.local.getArticleDetail(tag: tag, key: key)
                        .map{ArticleMapper.mapArticleDetailEntityToDomain(input: $0)}
                        .eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
    
    func getSearchRecipe(query: String) -> AnyPublisher<[SearchModel], Error> {
        return self.remote.searchRecipes(query: query)
            .map{ SearchMapper.mapSearchResponseToDomain(input: $0)}
            .eraseToAnyPublisher()
    }
    
    
}
