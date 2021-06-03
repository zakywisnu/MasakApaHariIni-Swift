//
//  RecipeCategoryPresenter.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 28/05/21.
//

import Foundation
import Combine
import SwiftUI

class RecipeCategoryPresenter: ObservableObject{
    private var cancellables: Set<AnyCancellable> = []
    private let router = RecipeCategoryRouter()
    private let useCase: RecipeCategoryUseCase
    
    @Published var category: [CategoryModel] = []
    @Published var isError: Bool = false
    @Published var isLoading: Bool = false
    @Published var errorMessages: String = ""
    
    init(useCase: RecipeCategoryUseCase) {
        self.useCase = useCase
    }
    
    func getRecipeCategory() {
        isLoading = true
        useCase.getRecipeCategory()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessages = error.localizedDescription
                    self.isLoading = false
                    self.isError = true
                case .finished:
                    self.isLoading = false
                }
            }, receiveValue: { result in
                self.category = result
            })
            .store(in: &cancellables)
    }
    
    func linkBuilder<Content: View> (
        for recipe: CategoryModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(destination: router.makeRecipeByCategoryView(for: recipe)) {
            content()
        }
    }
}
