//
//  ContentView.swift
//  RandomColor
//
//  Created by Aryan Palit on 1/8/25.
//

import SwiftUI

/// A view model that manages the state and logic for generating and copying random colors.
class ContentViewModel: ObservableObject {
    /// The current background color displayed in the view.
    @Published var backgroundColor: Color = .white

    /// An optional message displayed when a color is copied to the clipboard.
    @Published var copiedMessage: String? = ""

    /// Generates a random color with random hue, saturation, and brightness values.
    func randomColorGen() -> Color {
        Color(hue: Double.random(in: 0...1), saturation: Double.random(in: 0...1), brightness: Double.random(in: 0...1))
    }
}

struct colorGenView: View {
    @StateObject private var viewModel = ContentViewModel()

    var body: some View {
        ZStack {
            // Background
            RadialGradient(
                gradient: Gradient(colors: [Color.black, Color.purple.opacity(0.8), Color.blue.opacity(0.6)]),
                center: .center,
                startRadius: 50,
                endRadius: 500
            )
            .ignoresSafeArea()

            VStack(spacing: 40) {
                // Title
                Text("Random Color Generator")
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .shadow(color: .blue.opacity(0.5), radius: 10, x: 0, y: 5)

                // Color Display
                RoundedRectangle(cornerRadius: 20)
                    .fill(viewModel.backgroundColor)
                    .frame(width: 250, height: 250)
                    .shadow(color: viewModel.backgroundColor.opacity(0.5), radius: 10, x: 0, y: 5)
                    .overlay(
                        Text(viewModel.backgroundColor.toHexString())
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.6).cornerRadius(10))
                            .padding(8)
                    )

                // Copy Button
                HStack(spacing: 16) {
                    Button(action: {
                        UIPasteboard.general.string = viewModel.backgroundColor.toHexString()
                        viewModel.copiedMessage = "Color copied to clipboard!"
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            viewModel.copiedMessage = nil
                        }
                    }) {
                        Label("Copy Color", systemImage: "doc.on.doc")
                            .font(.headline)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.white.opacity(0.2))
                            )
                            .foregroundColor(.white)
                            .shadow(color: Color.white.opacity(0.2), radius: 10, x: 0, y: 5)
                    }
                    .buttonStyle(.plain)

                    if let message = viewModel.copiedMessage {
                        Text(message)
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .transition(.opacity)
                    }
                }

                // Generate Button
                Button(action: {
                    withAnimation {
                        viewModel.backgroundColor = viewModel.randomColorGen()
                    }
                }) {
                    Text("Generate Random Color")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(LinearGradient(
                                    gradient: Gradient(colors: [Color.blue, Color.purple]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ))
                        )
                        .foregroundColor(.white)
                        .shadow(color: Color.purple.opacity(0.5), radius: 10, x: 0, y: 5)
                }
                .padding(.horizontal, 40)
            }
            .padding()
        }
       // .navigationBarHidden(true)
    }
}



// MARK: - Preview
#Preview {
    colorGenView()
}

