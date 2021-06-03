//
//  ArticleByCategoryPresenter.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 27/05/21.
//

import Foundation
import SwiftUI
import Combine

class ArticleByCategoryPresenter: ObservableObject{
    private var cancellable: Set<AnyCancellable> = []
    private var useCase: ArticleByCategoryUseCase
    private let router = ArticleByCategoryRouter()
    
    @Published var article: [ArticleCategoryModel] = []
    @Published var errorMessages: String = ""
    @Published var isLoading: Bool = false
    @Published var isError: Bool = false
    
    init(useCase: ArticleByCategoryUseCase) {
        self.useCase = useCase
    }
    
    func getArticleByCategory(){
        isLoading = true
        useCase.getArticleByCategory()
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
            }, receiveValue: {result in
                self.article = result
            }).store(in: &cancellable)
    }
    
    func linkBuilder<Content: View> (
        for artic: ArticleCategoryModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(destination: router.makeArticleDetailView(for: artic)){
            content()
        }
    }
}
