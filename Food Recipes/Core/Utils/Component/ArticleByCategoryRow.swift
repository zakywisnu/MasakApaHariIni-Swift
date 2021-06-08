//
//  ArticleByCategoryRow.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 28/05/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ArticleByCategoryRow: View {
    var article: ArticleCategoryModel
    var body: some View {
        VStack{
            HStack{
                WebImage(url: URL(string: article.thumb))
                    .resizable()
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .frame(width: 150, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                Spacer()
                Text(article.title)
                    .font(.caption)
                    .padding()
                    .foregroundColor(.black)
                Spacer()
            }
        }
        .frame(width: UIScreen.main.bounds.width - 32)
        .padding(4)
        .background(Color.black.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        
    }
}

struct ArticleByCategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        ArticleByCategoryRow(article: ArticleCategoryModel(title: "Apa Saja sih Masakan Lobster Khas Restoran yang Terkenal? Cari Tahu, Yuk!", thumb: "https://www.masakapahariini.com/wp-content/uploads/2021/05/masakan-lobster-thermidor-400x240.jpg", tags: "Makanan & Gaya Hidup", key: "rekomendasi-masakan-rumahan-idul-adha"))
    }
}


