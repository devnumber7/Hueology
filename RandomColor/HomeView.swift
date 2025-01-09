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
        VStack {
            Text("Home")
                .font(.largeTitle)
                .padding()
            
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: columns, alignment: .center, spacing: 28) {
                        ForEach(0..<items.count, id: \.self) { index in
                            let item = items[index]
                            NavigationLink(destination: item.1) {
                                Text(item.0)
                                    .frame(maxWidth: .infinity, minHeight: 50)
                                // .background(Color.gray.opacity(0.2)) // Added background for better visibility
                                    .cornerRadius(8)
                                   
                                    .fontWeight(.bold)
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle("Get Started") // Optional: Set a navigation title
            }
        }
    }
}



#Preview{
    HomeView()
}

