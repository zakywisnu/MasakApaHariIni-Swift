//
//  ArticleDetailResponse.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 23/04/21.
//

import Foundation

struct ArticleDetailListResponse: Codable {
    let results: ArticleDetailResponse
}

struct ArticleDetailResponse: Codable {
    
    private enum CodingKeys: String, CodingKey{
        case title = "title"
        case thumb = "thumb"
        case author = "author"
        case date_published = "date_published"
        case description = "description"
    }
    
    let title: String?
    let thumb: String?
    let author: String?
    let date_published: String?
    let description: String?
}
