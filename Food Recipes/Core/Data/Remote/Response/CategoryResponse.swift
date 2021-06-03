//
//  CategoryResponse.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 23/04/21.
//

import Foundation

struct CategoryListResponse: Codable {
    let results: [CategoryResponse]
}

struct CategoryResponse: Codable {
    
    private enum CodingKeys: String, CodingKey{
        case category = "category"
        case key = "key"
    }
    
    let category: String?
    let key: String?
}
