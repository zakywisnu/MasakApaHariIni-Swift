//
//  ArticleDetailView.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 02/06/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ArticleDetailView: View {
    
    @ObservedObject var presenter: ArticleDetailPresenter
    
    var body: some View {
        ZStack{
            if self.presenter.isLoading {
                loadingIndicator
            } else if self.presenter.isError {
                errorIndicator
            } else {
                content
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear{
            self.presenter.getArticleDetail()
        }
    }
}

extension ArticleDetailView {
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
                VStack{
                    if self.presenter.detail.thumb == "" {
                        LottieView(filename: "error_image")
                            .frame(width: UIScreen.main.bounds.width, height: 225)
                    } else {
                        WebImage(url: URL(string: self.presenter.detail.thumb))
                            .resizable()
                            .indicator(.activity)
                            .transition(.fade(duration: 0.5))
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width)
                            .frame(maxWidth: .infinity)
                    }
                    
                    Text(self.presenter.detail.title)
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .padding()
                    
                    HStack{
                        Spacer()
                        VStack(){
                            Text("Penulis")
                                .font(.headline)
                                .padding(10)
                            Text(self.presenter.detail.author)
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
                            Text(self.presenter.detail.date_published)
                                .padding(.bottom, 10)
                                .padding(.horizontal, 10)
                        }
                        .background(Color.blue.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        Spacer()
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                    
                    Text(self.presenter.detail.description)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .padding(10)
                    
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
