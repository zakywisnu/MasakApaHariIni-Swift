//
//  AuthorMapper.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 25/05/21.
//

import Foundation

final class AuthorMapper {
    static func mapAuthorResponseToEntity(
        input authorResponse: AuthorResponse
    ) -> AuthorEntity {
        let newAuthor = AuthorEntity()
        newAuthor.user = authorResponse.user ?? ""
        newAuthor.datePublished = authorResponse.datePublished ?? ""
        return newAuthor
    }
    
    static func mapAuthorEntityToDomain(
        input authorEntity: AuthorEntity
    ) -> Author {
        return Author(user: authorEntity.user, datePublished: authorEntity.datePublished)
    }
}
