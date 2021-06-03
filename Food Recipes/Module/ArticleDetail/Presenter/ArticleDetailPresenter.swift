//
//  ArticleDetailPresenter.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 02/06/21.
//

import Foundation
import Combine

class ArticleDetailPresenter: ObservableObject{
    private var cancellables: Set<AnyCancellable> = []
    private let useCase: ArticleDetailUseCase
    
    @Published var detail: ArticleDetailModel = ArticleDetailModel(
        title: "",
        thumb: "",
        author: "",
        date_published: "",
        description: ""
    )
    @Published var isError = false
    @Published var isLoading = false
    @Published var errorMessages = ""
    
    init(useCase: ArticleDetailUseCase) {
        self.useCase = useCase
    }
    
    func getArticleDetail(){
        isLoading = true
        useCase.getArticleDetail()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: {completion in
                switch completion{
                case .failure(let error):
                    self.isError = true
                    self.isLoading = false
                    self.errorMessages = error.localizedDescription
                case .finished:
                    self.isLoading = false
                }
            }, receiveValue: {result in
                self.detail = result
            }).store(in: &cancellables)
    }
}
