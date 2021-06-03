//
//  ArticleMapper.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 24/05/21.
//

import Foundation

final class ArticleMapper {
    
    static func mapCategoryArticleResponseToEntity(
        input categoryResponse: [ArticleResponse]
    ) -> [ArticleEntity] {
        return categoryResponse.map{ result in
            let newCategory = ArticleEntity()
            newCategory.title = result.title ?? ""
            newCategory.key = result.key ?? ""
            return newCategory
        }
    }
    
    static func mapCategoryArticleEntityToDomain(
        input categoryEntity: [ArticleEntity]
    ) -> [ArticleModel] {
        return categoryEntity.map{ result in
            return ArticleModel(title: result.title, key: result.key)
        }
    }
    
    static func mapArticleByCategoryResponseToEntity(
        input categoryResponse: [CategoryArticleResponse]
    ) -> [ArticleCategoryEntity] {
        return categoryResponse.map{ result in
            let newCategory = ArticleCategoryEntity()
            newCategory.title = result.title ?? ""
            newCategory.thumbs = result.thumb ?? ""
            newCategory.tags = result.tags ?? ""
            newCategory.key = result.key ?? ""
            return newCategory
        }
    }
    
    static func mapArticleByCategoryEntityToDomain(
        input categoryEntity: [ArticleCategoryEntity]
    ) -> [ArticleCategoryModel] {
        return categoryEntity.map{ result in
            return ArticleCategoryModel(title: result.title, thumb: result.thumbs, tags: result.tags, key: result.key)
        }
    }
    
    static func mapArticleDetailResponseToEntity(
        input detailResponse: ArticleDetailResponse
    ) -> ArticleDetailEntity {
        let newArticle = ArticleDetailEntity()
        newArticle.title = detailResponse.title ?? ""
        newArticle.thumb = detailResponse.thumb ?? ""
        newArticle.date_published = detailResponse.date_published ?? ""
        newArticle.author = detailResponse.author ?? ""
        newArticle.articleDescription = detailResponse.description ?? ""
        return newArticle
    }
    
    static func mapArticleDetailEntityToDomain(
        input detailEntity: ArticleDetailEntity
    ) -> ArticleDetailModel {
        return ArticleDetailModel(
            title: detailEntity.title,
            thumb: detailEntity.thumb,
            author: detailEntity.author,
            date_published: detailEntity.date_published,
            description: detailEntity.articleDescription)
    }
}
