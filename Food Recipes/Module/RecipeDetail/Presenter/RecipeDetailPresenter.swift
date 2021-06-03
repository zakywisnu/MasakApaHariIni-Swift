//
//  RecipeDetailPresenter.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 29/05/21.
//

import Foundation
import Combine

class RecipeDetailPresenter: ObservableObject{
    
    private var cancellables: Set<AnyCancellable> = []
    private let useCase: RecipeDetailUseCase
    
    @Published var isError: Bool = false
    @Published var isLoading: Bool = false
    @Published var errorMessages: String = ""
    @Published var recipe: RecipeDetailModel =
        RecipeDetailModel(
            title: "",
            thumb: "",
            servings: "",
            times: "",
            difficulty: "",
            authorModel: Author(user: "", datePublished: ""),
            ingredient: [],
            step: []
        )
    
    init(useCase: RecipeDetailUseCase) {
        self.useCase = useCase
    }
    
    func getDetailRecipe() {
        isLoading = true
        useCase.getRecipeDetail()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: {completion in
                switch completion {
                case .failure(let error):
                    self.isLoading = false
                    self.isError = true
                    self.errorMessages = error.localizedDescription
                case .finished:
                    self.isLoading = false
                }
            }, receiveValue: {result in
                self.recipe = result
            })
            .store(in: &cancellables)
    }
    
}
