//
//  ArticleResponse.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 23/04/21.
//

import Foundation

struct ArticleListResponse: Codable {
    let results: [ArticleResponse]
}

struct ArticleResponse: Codable{
    
    private enum CodingKeys: String, CodingKey{
        case title = "title"
        case key = "key"
    }
    
    let title: String?
    let key: String?
}
