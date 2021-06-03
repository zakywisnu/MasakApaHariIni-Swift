//
//  SearchResponse.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 23/04/21.
//

import Foundation

struct SearchListResponse: Codable {
    let results: [SearchResponse]
}

struct SearchResponse: Codable {
    
    private enum CodingKeys: String, CodingKey{
        case title = "title"
        case thumb = "thumb"
        case key = "key"
        case times = "times"
        case serving = "serving"
        case difficulty = "difficulty"
    }
    
    let title: String
    let thumb: String
    let key: String
    let times: String
    let serving: String
    let difficulty: String
}
