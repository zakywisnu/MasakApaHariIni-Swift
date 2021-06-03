//
//  AuthorEntity.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 21/05/21.
//

import Foundation
import RealmSwift

class AuthorEntity: Object {
    @objc dynamic var user: String = ""
    @objc dynamic var datePublished: String = ""
}
