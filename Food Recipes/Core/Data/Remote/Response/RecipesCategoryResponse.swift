//
//  RecipesCategoryResponse.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 23/04/21.
//

import Foundation

struct RecipeCategoryListResponse: Codable {
    let results: [RecipeCategoryResponse]
}

struct RecipeCategoryResponse: Codable {
    
    private enum CodingKeys: String, CodingKey{
        case title = "title"
        case thumb = "thumb"
        case key = "key"
        case times = "times"
        case portion = "portion"
        case difficulty = "dificulty"
    }
    
    let title: String
    let thumb: String
    let key: String
    let times: String
    let portion: String
    let difficulty: String
}
