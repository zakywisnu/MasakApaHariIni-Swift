//
//  LocalDataSource.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 06/05/21.
//

import Foundation
import Combine
import RealmSwift

protocol LocalDataSourceProtocol: AnyObject {
    func getCategoryRecipe() -> AnyPublisher<[CategoryEntity], Error>
    func addCategoryRecipe(from categories: [CategoryEntity]) -> AnyPublisher<Bool, Error>
    
    func getRecipeByCategory(key: String) -> AnyPublisher<[RecipeCategoryEntity], Error>
    func addRecipeByCategory(from categories: [RecipeCategoryEntity]) -> AnyPublisher<Bool, Error>
    
    func getRecipeDetail(key: String) -> AnyPublisher<RecipeDetailEntity, Error>
    func addRecipeDetail(from detail: RecipeDetailEntity) -> AnyPublisher<Bool, Error>
    
    func getCategoryArticle() -> AnyPublisher<[ArticleEntity], Error>
    func addCategoryArticle(from articles: [ArticleEntity]) -> AnyPublisher<Bool, Error>
    
    func getArticleByCategory(key: String) -> AnyPublisher<[ArticleCategoryEntity], Error>
    func addArticleByCategory(from articles: [ArticleCategoryEntity]) -> AnyPublisher<Bool, Error>
    
    func getArticleDetail(tag: String, key: String) -> AnyPublisher<ArticleDetailEntity, Error>
    func addArticleDetail(from articles: ArticleDetailEntity) -> AnyPublisher<Bool, Error>
}

class LocalDataSource: NSObject {
    private let realm: Realm?
    
    private init(realm: Realm?){
        self.realm = realm
    }
    
    static let sharedInstance: (Realm?) -> LocalDataSource = {realmDatabase in
        return LocalDataSource(realm: realmDatabase)
    }
    
}

extension LocalDataSource: LocalDataSourceProtocol {
    func getCategoryRecipe() -> AnyPublisher<[CategoryEntity], Error> {
        return Future<[CategoryEntity], Error> { completion in
            if let realm = self.realm {
                let categories: Results<CategoryEntity> = {
                    realm.objects(CategoryEntity.self)
                        .sorted(byKeyPath: "category", ascending: true)
                }()
                completion(.success(categories.toArray(ofType: CategoryEntity.self)))
            }
            else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func addCategoryRecipe(from categories: [CategoryEntity]) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    try realm.write{
                        for category in categories {
                            realm.add(category,update: .all)
                        }
                        completion(.success(true))
                    }
                }
                catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func getRecipeByCategory(key: String) -> AnyPublisher<[RecipeCategoryEntity], Error> {
        return Future<[RecipeCategoryEntity], Error> { completion in
            if let realm = self.realm {
                let categories: Results<RecipeCategoryEntity> = {
                    realm.objects(RecipeCategoryEntity.self)
                        .sorted(byKeyPath: "title", ascending: true)
                }()
                completion(.success(categories.toArray(ofType: RecipeCategoryEntity.self)))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func addRecipeByCategory(from categories: [RecipeCategoryEntity]) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    try realm.write {
                        for category in categories {
                            realm.add(category, update: .all)
                        }
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            }
            else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func getRecipeDetail(key: String) -> AnyPublisher<RecipeDetailEntity, Error> {
        return Future<RecipeDetailEntity, Error> { completion in
            if let realm = self.realm {
                
                let details: Results<RecipeDetailEntity> = {
                    realm.objects(RecipeDetailEntity.self)
                }()
                
                guard let detail = details.first else {
                    completion(.failure(DatabaseError.requestFailed))
                     return
                }
                completion(.success(detail))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func addRecipeDetail(from detail: RecipeDetailEntity) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    try realm.write{
                        realm.add(detail, update: .all)
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func getCategoryArticle() -> AnyPublisher<[ArticleEntity], Error> {
        return Future<[ArticleEntity], Error> { completion in
            if let realm = self.realm {
                let article: Results<ArticleEntity> = {
                    realm.objects(ArticleEntity.self)
                        .sorted(byKeyPath: "title", ascending: true)
                }()
                completion(.success(article.toArray(ofType: ArticleEntity.self)))
            } else{
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func addCategoryArticle(from articles: [ArticleEntity]) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    try realm.write{
                        for article in articles {
                            realm.add(article, update: .all)
                        }
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func getArticleByCategory(key: String) -> AnyPublisher<[ArticleCategoryEntity], Error> {
        return Future<[ArticleCategoryEntity], Error> { completion in
            if let realm = self.realm {
                let article: Results<ArticleCategoryEntity> = {
                    realm.objects(ArticleCategoryEntity.self)
                        .sorted(byKeyPath: "title", ascending: true)
                }()
                completion(.success(article.toArray(ofType: ArticleCategoryEntity.self)))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func addArticleByCategory(from articles: [ArticleCategoryEntity]) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    try realm.write{
                        for article in articles {
                            realm.add(article, update: .all)
                        }
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func getArticleDetail(tag: String, key: String) -> AnyPublisher<ArticleDetailEntity, Error> {
        return Future<ArticleDetailEntity, Error> { completion in
            if let realm = self.realm {
                let details: Results<ArticleDetailEntity> = {
                    realm.objects(ArticleDetailEntity.self)
                        .filter("tag = \(tag)")
                }()
                guard let detail = details.first else {
                    completion(.failure(DatabaseError.requestFailed))
                    return
                }
                completion(.success(detail))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func addArticleDetail(from articles: ArticleDetailEntity) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    try realm.write{
                        realm.add(articles, update: .all)
                        completion(.success(true))
                    }
                }
                catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    
}
