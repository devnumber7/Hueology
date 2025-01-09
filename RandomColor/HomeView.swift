//
//  HomeView.swift
//  RandomColor
//
//  Created by Aryan Palit on 1/9/25.
//

import SwiftUI

struct HomeView: View {
    let items = [
        ("Learn the basics of Color Theory", AnyView(ColorTheoryView())),
        ("Generate Random Colors", AnyView(colorGenView())),
          //("Item 3", AnyView(ThirdView()))
      ]
    // Define the grid structure
    let columns = [
        GridItem(.flexible()),
      
    ]

    var body: some View {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(0..<items.count, id: \.self) { index in
                            let item = items[index]
                            NavigationLink(destination: item.1) {
                                Text(item.0) // Display the title
                                    .frame(maxWidth: .infinity, minHeight: 50)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(8)
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle("Home")
            }
        }
}


struct GridWithNavigationExample_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
