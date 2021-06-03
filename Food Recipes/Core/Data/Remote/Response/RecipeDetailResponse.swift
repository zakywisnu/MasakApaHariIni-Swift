//
//  RecipeDetailResponse.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 23/04/21.
//

import Foundation

struct RecipeDetailListResponse: Codable {
    let results: RecipeDetailResponse
}

struct RecipeDetailResponse: Codable {
    
    private enum CodingKeys: String, CodingKey{
        case title = "title"
        case thumb = "thumb"
        case servings = "servings"
        case times = "times"
        case difficulty = "difficulty"
        case author = "author"
//        case needItem = "needItem"
        case ingredient = "ingredient"
        case step = "step"
    }
    
    let title: String?
    let thumb: String?
    let servings: String?
    let times: String?
    let difficulty: String?
    let author: AuthorResponse?
//    let needItem: [NeedItemResponse]?
    let ingredient: [String]?
    let step: [String]?
}

struct AuthorResponse: Codable {
    
    enum CodingKeys: String, CodingKey{
        case user = "user"
        case datePublished = "datePublished"
    }
    
    let user: String
    let datePublished: String
}

//struct NeedItemResponse: Codable {
//
//    enum CodingKeys: String, CodingKey{
//        case item = "item_name"
//        case item_thumb = "thumb_name"
//    }
//
//    let item: String
//    let item_thumb: String
//}

