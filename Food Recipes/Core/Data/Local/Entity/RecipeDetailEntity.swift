//
//  RecipeDetailEntity.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 20/05/21.
//

import Foundation
import RealmSwift

class RecipeDetailEntity: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var thumb: String = ""
    @objc dynamic var servings: String = ""
    @objc dynamic var times: String = ""
    @objc dynamic var difficulty: String = ""
    var authorEntity: AuthorEntity?
    var ingredients = List<String>()
    var step = List<String>()
    
    
    override static func primaryKey() -> String? {
        return "title"
    }
    
    override init() {
        
    }
    
    required init(title: String, thumb: String, servings: String, times: String, difficulty: String, author: AuthorEntity, ingredients: [String], step: [String]) {
        self.title = title
        self.thumb = thumb
        self.servings = servings
        self.times = times
        self.difficulty = difficulty
        authorEntity = author
        self.ingredients.append(objectsIn: ingredients.map{$0})
        self.step.append(objectsIn: step.map{$0})
    }
}
