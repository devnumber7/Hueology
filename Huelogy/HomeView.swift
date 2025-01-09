//
//  HomeView.swift
//  RandomColor
//
//  Created by Aryan Palit on 1/9/25.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Data
    let items = [
        ("Learn the basics of Color Theory", AnyView(ColorTheoryView())),
        ("Generate Random Colors", AnyView(colorGenView()))
    ]
    
    // Single column grid
    let columns = [
        GridItem(.flexible())
    ]
    
    // Background colors for the items
    let cardColors: [Color] = [.pink, .orange, .yellow, .mint, .blue, .purple]
    
    // Animation state for staggered effect
    @State private var animateCards = false
    
    var body: some View {
        // Wrap everything in a NavigationView
        NavigationView {
            ZStack {
                // MARK: - Background Gradient
                LinearGradient(
                    gradient: Gradient(colors: [.blue.opacity(0.4), .purple.opacity(0.6)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // MARK: - Title
                    Text("Hueology")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .fontDesign(.serif)
                        .foregroundColor(.white)
                        .padding(.top, 40)
                    
                    // MARK: - Grid with Navigation Buttons
                    ScrollView {
                        LazyVGrid(columns: columns, alignment: .center, spacing: 28) {
                            ForEach(0..<items.count, id: \.self) { index in
                                let item = items[index]
                                
                                NavigationLink(destination: item.1) {
                                    // Custom Navigation Button
                                    Text(item.0)
                                        .frame(maxWidth: .infinity, minHeight: 60)
                                        .background(cardColors[index % cardColors.count].opacity(0.8))
                                        .cornerRadius(15)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(.horizontal)
                                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
                                        // MARK: - Staggered Animation
                                        .scaleEffect(animateCards ? 1 : 0.8)
                                        .opacity(animateCards ? 1 : 0)
                                        .animation(.easeOut(duration: 0.6).delay(Double(index) * 0.1),
                                                   value: animateCards)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding()
                    }
                    .onAppear {
                        // Trigger staggered animations
                        animateCards = true
                    }
                }
            }
            // Hide the navigation bar, but still allow navigation
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    HomeView()
}
