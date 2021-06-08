//
//  SearchPresenter.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 28/05/21.
//

import Foundation
import Combine
import SwiftUI

class SearchPresenter: ObservableObject{
    private var cancellables: Set<AnyCancellable> = []
    private let useCase: SearchUseCase
    private let router = SearchRouter()
    
    @Published var search: [SearchModel] = []
    @Published var isError: Bool = false
    @Published var isLoading: Bool = false
    @Published var errorMessages: String = ""
    
    var query = ""
    
    init(useCase: SearchUseCase) {
        self.useCase = useCase
    }
    
    func getSearchRecipes(){
        isLoading = true
        useCase.getSearchRecipe(query: query)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.isError = true
                    self.errorMessages = error.localizedDescription
                    self.isLoading = false
                case .finished:
                    self.isLoading = false
                }
            }, receiveValue: {result in
                self.search = result
            })
            .store(in: &cancellables)
    }
    
    func linkBuilder<Content: View>(
        for searchs: SearchModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(destination: router.makeDetailView(for: searchs)) {
            content()
        }
    }
}
