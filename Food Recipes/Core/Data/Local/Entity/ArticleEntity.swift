//
//  ArticleEntity.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 20/05/21.
//

import Foundation
import RealmSwift


class ArticleEntity: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var key: String = ""
    
    override static func primaryKey() -> String? {
        return "title"
    }
}
