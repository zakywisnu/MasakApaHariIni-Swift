//
//  RemoteDataSource.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 23/04/21.
//

import Foundation
import Combine
import Alamofire

protocol RemoteDataSourceProtocol: AnyObject {
    func getCategory() -> AnyPublisher<[CategoryResponse], Error>
    func getRecipeCategory(key: String) -> AnyPublisher<[RecipeCategoryResponse], Error>
    func getRecipeDetail(key: String) -> AnyPublisher<RecipeDetailResponse, Error>
    func getArticle() -> AnyPublisher<[ArticleResponse], Error>
    func getArticleCategory(key: String) -> AnyPublisher<[CategoryArticleResponse], Error>
    func getArticleDetail(tag: String, key: String) -> AnyPublisher<ArticleDetailResponse, Error>
    func searchRecipes(query: String) -> AnyPublisher<[SearchResponse], Error>
}

class RemoteDataSource: NSObject {
    private override init() {}
    static let sharedInstance: RemoteDataSource = RemoteDataSource()
}

extension RemoteDataSource: RemoteDataSourceProtocol {
    func getCategory() -> AnyPublisher<[CategoryResponse], Error> {
        return Future<[CategoryResponse], Error> { completion in
            if let url = URL(string: Endpoints.Gets.category.url) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: CategoryListResponse.self) { response in
                        switch response.result {
                        case.success(let value):
                            completion(.success(value.results))
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
    func getRecipeCategory(key: String) -> AnyPublisher<[RecipeCategoryResponse], Error> {
        return Future<[RecipeCategoryResponse], Error> { completion in
            if let url = URL(string: Endpoints.Gets.recipesCategory(key: key).url) {
                
                AF.request(url)
                    .validate()
                    .responseDecodable(of: RecipeCategoryListResponse.self) { response in
                        switch response.result{
                        case .success(let value):
                            completion(.success(value.results))
                            print("list", value.results)
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
    
    func getRecipeDetail(key: String) -> AnyPublisher<RecipeDetailResponse, Error> {
        return Future<RecipeDetailResponse, Error> { completion in
            if let url = URL(string: Endpoints.Gets.recipeDetail(key: key).url) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: RecipeDetailListResponse.self) { response in
                        switch response.result{
                        case .success(let value):
                            completion(.success(value.results))
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
    
    func getArticle() -> AnyPublisher<[ArticleResponse], Error> {
        return Future<[ArticleResponse], Error> { completion in
            if let url = URL(string: Endpoints.Gets.article.url){
                AF.request(url)
                    .validate()
                    .responseDecodable(of: ArticleListResponse.self) { response in
                        switch response.result{
                        case .success(let value):
                            completion(.success(value.results))
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
    
    func getArticleCategory(key: String) -> AnyPublisher<[CategoryArticleResponse], Error> {
        return Future<[CategoryArticleResponse], Error> { completion in
            if let url = URL(string: Endpoints.Gets.articleCategory(key: key).url){
                AF.request(url)
                    .validate()
                    .responseDecodable(of: CategoryArticleListResponse.self){ response in
                        switch response.result{
                        case .success(let value):
                            completion(.success(value.results))
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
    
    func getArticleDetail(tag: String, key: String) -> AnyPublisher<ArticleDetailResponse, Error> {
        return Future<ArticleDetailResponse, Error> { completion in
            if let url = URL(string: Endpoints.Gets.articleDetail(tag: tag, key: key).url){
                AF.request(url)
                    .validate()
                    .responseDecodable(of: ArticleDetailListResponse.self){ response in
                        switch response.result{
                        case .success(let value):
                            completion(.success(value.results))
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
    
    func searchRecipes(query: String) -> AnyPublisher<[SearchResponse], Error> {
        return Future<[SearchResponse], Error> { completion in
            if let url = URL(string: Endpoints.Gets.search(query: query).url){
                AF.request(url)
                    .validate()
                    .responseDecodable(of: SearchListResponse.self) { response in
                        switch response.result{
                        case .success(let value):
                            completion(.success(value.results))
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
    
    
}
