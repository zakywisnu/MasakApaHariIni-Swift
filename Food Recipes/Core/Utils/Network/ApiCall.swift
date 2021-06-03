//
//  ApiCall.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 20/05/21.
//

import Foundation

struct API {
    static let baseUrl = "https://masak-apa.tomorisakura.vercel.app"
}

protocol Endpoint {
    var url: String {get}
}

enum Endpoints {
    enum Gets: Endpoint {
        case category
        case recipesCategory(key: String)
        case recipeDetail(key: String)
        case article
        case articleCategory(key: String)
        case articleDetail(tag: String, key: String)
        case search(query: String)
        
        public var url: String{
            switch self {
            case .category: return "\(API.baseUrl)/api/categorys/recipes"
            case .recipesCategory(let key):
                print("network","\(API.baseUrl)/api/categorys/recipes/\(key)")
                return "\(API.baseUrl)/api/categorys/recipes/\(key)"
            case .recipeDetail(let key): return "\(API.baseUrl)/api/recipe/\(key)"
            case .article: return "\(API.baseUrl)/api/categorys/article"
            case .articleCategory(let key): return "\(API.baseUrl)/api/categorys/article/\(key)"
            case .articleDetail(let tag, let key): return "\(API.baseUrl)/api/article/\(tag)/\(key)"
            case .search(let query): return "\(API.baseUrl)/api/search/?q=\(query)"
            }
        }
    }
}
