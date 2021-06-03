//
//  RecipeDetailModel.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 25/05/21.
//

import Foundation

struct RecipeDetailModel: Equatable {
    let title: String
    let thumb: String
    let servings: String
    let times: String
    let difficulty: String
    var authorModel: Author?
//    let needItem: [NeedItem]
    let ingredient: [String]
    let step: [String]
}

struct Author: Equatable {
    
    let user: String
    let datePublished: String
}

struct NeedItem: Equatable {
    
    let item: String
    let item_thumb: String
}
