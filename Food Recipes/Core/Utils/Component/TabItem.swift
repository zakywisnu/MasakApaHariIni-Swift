//
//  TabItem.swift
//  Food Recipes
//
//  Created by Ahmad Zaky on 28/05/21.
//

import Foundation
import SwiftUI

struct TabItem: View {

  var imageName: String
  var title: String
  var body: some View {
    VStack {
      Image(systemName: imageName)
      Text(title)
    }
  }

}
