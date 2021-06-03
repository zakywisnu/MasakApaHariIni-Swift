//
//  NeedItemEntity.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 21/05/21.
//

import Foundation
import RealmSwift

class NeedItemEntity: Object {
    @objc dynamic var item: String = ""
    @objc dynamic var item_thumb: String = ""
}
