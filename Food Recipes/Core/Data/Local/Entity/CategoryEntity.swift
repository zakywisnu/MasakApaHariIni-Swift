//
//  CategoryEntity.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 20/05/21.
//

import Foundation
import RealmSwift

class CategoryEntity: Object {
    @objc dynamic var category: String = ""
    @objc dynamic var key: String = ""
    
    override static func primaryKey() -> String? {
        return "category"
    }
}
