//
//  CategoryArticleResponse.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 23/04/21.
//

import Foundation

struct CategoryArticleListResponse: Codable {
    let results: [CategoryArticleResponse]
}

struct CategoryArticleResponse: Codable {
    
    private enum CodingKeys: String, CodingKey{
        case title = "title"
        case thumb = "thumb"
        case tags = "tags"
        case key = "key"
    }
    
    let title: String?
    let thumb: String?
    let tags: String?
    let key: String?
    
}
