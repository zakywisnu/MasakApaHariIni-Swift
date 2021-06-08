//
//  RecipeMapper.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 24/05/21.
//

import Foundation

final class RecipeMapper {
    static func mapRecipeCategoryResponseToEntity(
        input recipeResponse: [CategoryResponse]
    ) -> [CategoryEntity] {
        return recipeResponse.map{ result in
            let newCategory = CategoryEntity()
            newCategory.key = result.key ?? ""
            newCategory.category = result.category ?? ""
            return newCategory
        }
    }
    
    static func mapRecipeCategoryEntityToDomain(
        input recipeEntity: [CategoryEntity]
    ) -> [CategoryModel] {
        return recipeEntity.map{ result in
            return CategoryModel(category: result.category, key: result.key)
        }
    }
    
    static func mapRecipeByCategoryResponseToEntity(
        input recipeResponse: [RecipeCategoryResponse]
    ) -> [RecipeCategoryEntity] {
        return recipeResponse.map{ result in
            let newCategory = RecipeCategoryEntity()
            newCategory.title = result.title
            newCategory.times = result.times
            newCategory.thumb = result.thumb
            newCategory.portion = result.portion
            newCategory.key = result.key
            newCategory.difficulty = result.difficulty
            return newCategory
        }
    }
    
    static func mapRecipeByCategoryEntityToDomain(
        input recipeEntity: [RecipeCategoryEntity]
    ) -> [RecipeCategoryModel] {
        return recipeEntity.map{ result in
            return RecipeCategoryModel(title: result.title, thumb: result.thumb, key: result.key, times: result.times, portion: result.portion, difficulty: result.difficulty)
        }
    }
    
    static func mapRecipeByCategoryResponseToDomain(
        input recipeResponse: [RecipeCategoryResponse]
    ) -> [RecipeCategoryModel] {
        return recipeResponse.map{ result in
            return RecipeCategoryModel(title: result.title , thumb: result.thumb , key: result.key , times: result.times, portion: result.portion, difficulty: result.difficulty)
        }
    }
    
    static func mapRecipeDetailResponseToEntity(
        input recipeResponse: RecipeDetailResponse
    ) -> RecipeDetailEntity {
        let author = AuthorMapper.mapAuthorResponseToEntity(input: recipeResponse.author ?? AuthorResponse(user: "", datePublished: ""))
//        let needItems = NeedItemMapper.mapNeedItemResponseToEntity(input: recipeResponse.needItem ?? [])
        let newDetail = RecipeDetailEntity(title: recipeResponse.title ?? "", thumb: recipeResponse.thumb ?? "", servings: recipeResponse.servings ?? "", times: recipeResponse.times ?? "", difficulty: recipeResponse.difficulty ?? "", author: author, ingredients: recipeResponse.ingredient ?? [], step: recipeResponse.step ?? [])
//        newDetail.title = recipeResponse.title ?? ""
//        newDetail.times = recipeResponse.times ?? ""
//        newDetail.thumb = recipeResponse.thumb ?? ""
//        newDetail.servings = recipeResponse.servings ?? ""
//        newDetail.step = recipeResponse.step
//        newDetail.ingredients = recipeResponse.ingredient
//        newDetail.difficulty = recipeResponse.difficulty ?? ""
//        newDetail.authorEntity = author
//        newDetail.needItems = needItems
        return newDetail
    }
    
    static func mapRecipeDetailEntityToDomain(
        input recipeEntity: RecipeDetailEntity
    ) -> RecipeDetailModel {
        let author = AuthorMapper.mapAuthorEntityToDomain(input: recipeEntity.authorEntity!)
//        let needItems = NeedItemMapper.mapNeedItemEntityToDomain(input: recipeEntity.needItems)
        return RecipeDetailModel(
            title: recipeEntity.title,
            thumb: recipeEntity.thumb,
            servings: recipeEntity.servings,
            times: recipeEntity.times,
            difficulty: recipeEntity.difficulty,
            authorModel: author,
//            needItem: needItems,
            ingredient: recipeEntity.ingredients.map{ $0 },
            step: recipeEntity.step.map{$0}
        )
    }
    
    static func mapRecipeDetailResponseToDomain(
        input detailResponse: RecipeDetailResponse
    ) -> RecipeDetailModel {
        let author = AuthorMapper.mapAuthorResponseToDomain(input: detailResponse.author!)
        return RecipeDetailModel(title: detailResponse.title ?? "", thumb: detailResponse.thumb ?? "", servings: detailResponse.servings ?? "", times: detailResponse.times ?? "", difficulty: detailResponse.difficulty ?? "", authorModel: author , ingredient: detailResponse.ingredient ?? [], step: detailResponse.step ?? [])
    }
    
}
