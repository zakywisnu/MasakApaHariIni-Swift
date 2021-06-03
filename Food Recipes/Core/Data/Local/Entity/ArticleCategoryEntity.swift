//
//  ArticleCategoryEntity.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 20/05/21.
//

import Foundation
import RealmSwift

class ArticleCategoryEntity: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var thumbs: String = ""
    @objc dynamic var tags: String = ""
    @objc dynamic var key: String = ""
    
    override static func primaryKey() -> String? {
        return "title"
    }
}
