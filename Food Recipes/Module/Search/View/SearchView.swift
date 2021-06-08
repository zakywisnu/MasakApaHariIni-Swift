//
//  SearchView.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 28/05/21.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var presenter: SearchPresenter
    
    var body: some View {
        VStack {
            SearchBar(
                text: $presenter.query,
                onSearchButtonClicked: presenter.getSearchRecipes
            )
            
            ZStack{
                if presenter.isLoading {
                    loadingIndicator
                } else if presenter.isError {
                    errorIndicator
                } else {
                    content
                }
            }
            Spacer()
        }
        .navigationBarTitle("Search", displayMode: .automatic)
    }
}

extension SearchView {
    var loadingIndicator: some View {
        VStack{
            LottieView(filename: "food_loading")
        }
    }
    
    var errorIndicator: some View {
        VStack {
            LottieView(filename: "food_error")
        }
    }
    var content: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(
                    self.presenter.search,
                    id: \.key
                ) { result in
                    self.presenter.linkBuilder(for: result) {
                        SearchRow(search: result)
                    }
                }
            }
        }
    }
}
