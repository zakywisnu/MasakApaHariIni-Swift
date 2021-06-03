//
//  SearchMapper.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 27/05/21.
//

import Foundation

final class SearchMapper {
    static func mapSearchResponseToDomain(
        input searchResponse: [SearchResponse]
    ) -> [SearchModel] {
        return searchResponse.map{ result in
            return SearchModel(title: result.title, thumb: result.thumb, key: result.key, times: result.times, serving: result.serving, difficulty: result.difficulty)
        }
    }
}
