//
//  ArticleDetailEntity.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 20/05/21.
//

import Foundation
import RealmSwift

class ArticleDetailEntity: Object {
    
    @objc dynamic var title: String = ""
    @objc dynamic var thumb: String = ""
    @objc dynamic var author: String = ""
    @objc dynamic var date_published: String = ""
    @objc dynamic var articleDescription: String = ""
    
    override static func primaryKey() -> String? {
        return "title"
    }
}
