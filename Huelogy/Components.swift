//
//  Components.swift
//  Hueology
//
//  Created by Aryan Palit on 1/12/25.
//


import SwiftUI


struct SectionCard<Content: View>: View {
    let title: String
    let content: () -> Content

    var body: some View {
        LazyVStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.white)

            content()
                .font(.body)
                .foregroundColor(.white.opacity(0.9))
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.1))
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(LinearGradient(
                            gradient: Gradient(colors: [.blue, .purple]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ), lineWidth: 1)
                )
        )
        .padding(.bottom, 16)
    }
}



struct CodeSnippet: View {
    let code: String
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            Text(code)
                .font(.system(.body, design: .monospaced))
                .foregroundColor(.white)
                .padding()
                .background(Color.white.opacity(0.1))
                .cornerRadius(10)
        }
        .frame(maxHeight: 200) // Limit code snippet height
    }
}
