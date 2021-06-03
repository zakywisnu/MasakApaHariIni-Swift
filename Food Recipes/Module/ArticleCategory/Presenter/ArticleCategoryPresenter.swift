//
//  ArticleCategoryPresenter.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 27/05/21.
//

import Foundation
import SwiftUI
import Combine

class ArticleCategoryPresenter: ObservableObject{
    private var cancellables: Set<AnyCancellable> = []
    private var useCase: ArticleCategoryUseCase
    private var router = ArticleCategoryRouter()
    
    @Published var article: [ArticleModel] = []
    @Published var errorMessages: String = ""
    @Published var isError: Bool = false
    @Published var isLoading: Bool = false
    
    init(useCase: ArticleCategoryUseCase) {
        self.useCase = useCase
    }
    
    func getCategory() {
        isLoading = true
        useCase.getArticleCategory()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: {completion in
                switch completion {
                case .failure(let error):
                    self.errorMessages = error.localizedDescription
                    self.isLoading = false
                    self.isError = true
                case .finished:
                    self.isLoading = false
                }
            }, receiveValue: {articles in
                self.article = articles
            })
            .store(in: &cancellables)
    }
    
    func linkBuilder<Content: View>(
        for artic: ArticleModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(destination: router.makeArticleByCategoryView(for: artic)) { content() }
    }
}
