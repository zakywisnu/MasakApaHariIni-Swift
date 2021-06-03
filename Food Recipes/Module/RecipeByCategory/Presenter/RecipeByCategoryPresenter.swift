//
//  RecipeByCategoryPresenter.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 28/05/21.
//

import Foundation
import Combine
import SwiftUI

class RecipeByCategoryPresenter: ObservableObject{
    private var cancellables: Set<AnyCancellable> = []
    private let useCase: RecipeByCategoryUseCase
    private let router = RecipeByCategoryRouter()
    
    @Published var categories: [RecipeCategoryModel] = []
    @Published var isError: Bool = false
    @Published var isLoading: Bool = false
    @Published var errorMessages: String = ""
    
    init(useCase: RecipeByCategoryUseCase) {
        self.useCase = useCase
    }
    
    func getRecipeByCategory(){
        isLoading = true
        useCase.getRecipeByCategory()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: {completion in
                switch completion {
                case .failure(let error):
                    self.isError = true
                    self.isLoading = false
                    self.errorMessages = error.localizedDescription
                case .finished:
                    self.isLoading = false
                }
            }, receiveValue: {result in
                self.categories = result
            })
            .store(in: &cancellables)
    }
    
    func linkBuilder<Content: View>(
        for categories: RecipeCategoryModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(destination: router.makeRecipeDetailView(for: categories)) { content() }
    }
}
