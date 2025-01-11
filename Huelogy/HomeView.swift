//
//  HomeView.swift
//  RandomColor
//
//  Created by Aryan Palit on 1/9/25.
//
import SwiftUI

struct HomeView: View {
    let items = [
        ("Learn the basics of Color Theory", AnyView(ColorTheoryView()), "paintpalette"),
        ("Generate Random Colors", AnyView(colorGenView()), "wand.and.stars"),
        ("Colors Digitally", AnyView(IntroToComputingColorsViews()), "cpu")
    ]
    
    let columns = [
        GridItem(.flexible())
    ]
    
    @State private var animateCards = false
    
    var body: some View {
        NavigationView {
            ZStack {
                RadialGradient(
                    gradient: Gradient(colors: [Color.black, Color.purple.opacity(0.8), Color.blue.opacity(0.6)]),
                    center: .center,
                    startRadius: 50,
                    endRadius: 470
                )
                .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Title
                    Text("Hueology")
                        .font(.system(size: 48, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 40)
                        .shadow(color: .blue.opacity(0.5), radius: 10, x: 0, y: 5)
                    
                    Spacer().frame(height: 20)
                    
                    // Cards
                    ScrollView {
                        LazyVGrid(columns: columns, alignment: .center, spacing: 30) {
                            ForEach(0..<items.count, id: \.self) { index in
                                let item = items[index]
                                NavigationLink(destination: item.1) {
                                    HStack {
                                        Image(systemName: item.2)
                                            .font(.system(size: 24, weight: .bold))
                                            .foregroundColor(.white)
                                        Text(item.0)
                                            .font(.system(size: 20, weight: .medium, design: .rounded))
                                            .foregroundColor(.white)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, minHeight: 80)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.white.opacity(0.2))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                            )
                                            .shadow(color: .white.opacity(0.1), radius: 10, x: 0, y: 5)
                                            .blur(radius: 0.5)
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(LinearGradient(
                                                gradient: Gradient(colors: [.blue, .purple]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            ), lineWidth: 2)
                                    )
                                    .scaleEffect(animateCards ? 1 : 0.9)
                                    .opacity(animateCards ? 1 : 0)
                                    .animation(
                                        .easeOut(duration: 0.6).delay(Double(index) * 0.1),
                                        value: animateCards
                                    )
                                    .shadow(color: Color.blue.opacity(0.5), radius: 15, x: 0, y: 5)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.horizontal)
                    }
                    .onAppear {
                        animateCards = false
                        withAnimation(.easeInOut(duration: 1.2)) {
                            animateCards = true
                        }
                    }
                }
                .padding(.bottom, 40)
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    HomeView()
}

