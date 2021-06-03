//
//  RecipeCategoryEntity.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 20/05/21.
//

import Foundation
import RealmSwift


class RecipeCategoryEntity: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var thumb: String = ""
    @objc dynamic var key: String = ""
    @objc dynamic var times: String = ""
    @objc dynamic var portion: String = ""
    @objc dynamic var difficulty: String = ""
    
    override static func primaryKey() -> String? {
        return "title"
    }
}
