//
//  RecipeDetailView.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 29/05/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecipeDetailView: View {
    @ObservedObject var presenter: RecipeDetailPresenter
    
    
    var body: some View {
        ZStack{
            if self.presenter.isLoading {
                loadingIndicator
            } else if self.presenter.isError{
                errorIndicator
            } else {
                content
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear{
            self.presenter.getDetailRecipe()
        }
        
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(presenter: RecipeDetailPresenter(useCase: Injection.init().provideRecipeDetail(by: "resep-tongseng-kambing-sederhana")))
    }
}

extension RecipeDetailView {
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
            ScrollView(.vertical, showsIndicators: false){
                VStack {
                    if self.presenter.recipe.thumb == "" {
                        LottieView(filename: "error_image")
                            .frame(width: UIScreen.main.bounds.width, height: 225)
                    } else {
                    WebImage(url: URL(string: self.presenter.recipe.thumb))
                        .resizable()
                        .indicator(.activity)
                        .transition(.fade(duration: 0.5))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width)
                        .frame(maxWidth: .infinity)
                    }
                    
                    Text(self.presenter.recipe.title)
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .padding()
                    
                    HStack{
                        Spacer()
                        RecipeItem(image: "timer", name: self.presenter.recipe.times)
                            .padding(.top, 16)
                            .multilineTextAlignment(.center)
                        Spacer()
                        RecipeItem(image: "person.2", name: self.presenter.recipe.servings)
                            .padding(.top, 16)
                            .multilineTextAlignment(.center)
                        Spacer()
                        RecipeItem(image: "wand.and.stars", name: self.presenter.recipe.difficulty)
                            .padding(.top, 16)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width - 40)
                    .background(Color.black.opacity(0.05))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    
                    HStack{
                        Spacer()
                        VStack(){
                            Text("Penulis")
                                .font(.headline)
                                .padding(10)
                            Text(self.presenter.recipe.authorModel!.user)
                                .padding(.bottom, 10)
                                .padding(.horizontal, 10)
                        }
                        .background(Color.blue.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        Spacer()
                        VStack(spacing: 10){
                            Text("Tanggal")
                                .font(.headline)
                                .padding(10)
                            Text(self.presenter.recipe.authorModel!.datePublished)
                                .padding(.bottom, 10)
                                .padding(.horizontal, 10)
                        }
                        .background(Color.blue.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        Spacer()
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                    
                    HStack {
                        Text("Bahan")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.horizontal, 24)
                        
                        Spacer()
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(
                                self.presenter.recipe.ingredient,
                                id: \.self
                            ) { ingredients in
                                VStack {
                                    Text(ingredients)
                                        .padding()
                                }
                                .frame(width: 150, height: 150)
                                .background(Color.yellow.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    
                    HStack {
                        Text("Steps")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.horizontal, 24)
                        
                        Spacer()
                    }
                    
                    ForEach(
                        self.presenter.recipe.step,
                        id: \.self
                    ) { steps in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(steps)
                                .font(.footnote)
                                .padding(.vertical, 10)
                        }
                    }
                    .multilineTextAlignment(.leading)
                    .frame(width: UIScreen.main.bounds.width - 32)
                    
                    
                    Spacer()
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width, height: 70)
                        .foregroundColor(Color.white)
                    
                }
                .frame(maxHeight: .infinity)
            }
        }
    }
}
