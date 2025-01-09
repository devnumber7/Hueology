//
//  LearnView.swift
//  RandomColor
//
//  Created by Aryan Palit on 1/9/25.
//

import SwiftUI

/// A view that introduces users to color theory concepts and provides an interactive playground to explore color relationships.
struct ColorTheoryView: View {
    
    // MARK: - Color States
    @State private var hue: Double = 0.0
    @State private var saturation: Double = 0.5
    @State private var brightness: Double = 0.8
    
    private var currentColor: Color {
        Color(hue: hue, saturation: saturation, brightness: brightness)
    }
    
    private var complementaryColor: Color {
        let complementaryHue = (hue + 0.5).truncatingRemainder(dividingBy: 1.0)
        return Color(hue: complementaryHue, saturation: saturation, brightness: brightness)
    }
    
    var body: some View {
        ScrollView {
            ZStack {
                // MARK: - Background
                Color(UIColor.systemGray6) // Soft off-white background
                    .edgesIgnoringSafeArea(.all)
                
                // MARK: - Main Content
                VStack(alignment: .leading, spacing: 24) {
                    
                    // Title
                    Text("Introduction to Color Theory")
                        .font(.title)
                        .fontWeight(.bold)
                        .fontDesign(.serif)
                        .foregroundColor(.accentColor)
                        .padding(.top, 24)
                    
                    Divider() // A subtle divider under the title
                    
                    // Basics of Color Theory
                    SectionHeader(text: "Basics of Color Theory")
                    BodyText(content: """
                    Color theory is a set of principles used to create harmonious and visually appealing combinations of colors. It explores how colors interact, their psychological effects, and their cultural significance. At its core, color theory consists of:
                    • The color wheel (based on primary, secondary, and tertiary colors)
                    • Concepts like complementary, analogous, and triadic color schemes
                    • Methods to balance contrast, warmth, and coolness
                    """)
                    
                    // Color and Psychology
                    SectionHeader(text: "Color and Psychology")
                    BodyText(content: """
                    Colors have a profound impact on human psychology and can influence our emotions, behaviors, and perceptions. Here are a few examples:
                    •   Red can evoke feelings of passion, energy, or urgency.
                    •   Blue is often associated with calmness, trust, and reliability.
                    •   Yellow tends to represent happiness, optimism, and cheerfulness.
                    •   Green can symbolize nature, growth, or freshness.
                    
                    These emotional associations are used in marketing, design, and branding to subtly guide consumer behavior and shape mood.
                    """)
                    
                    // Scientific Basis of Color
                    SectionHeader(text: "Scientific Basis of Color")
                    BodyText(content: """
                    Scientifically, color is the result of light (electromagnetic waves) interacting with the human eye. The visible spectrum of light ranges from red (long wavelengths) to violet (short wavelengths).
                    
                    • **Isaac Newton** demonstrated that white light splits into a spectrum of colors through a prism, showing all colors are present in white light.
                    • The human eye contains **cones** that perceive color (red, green, blue) and **rods** that detect light intensity.
                    • Different color models exist (RGB, CMYK, HSB, etc.) for various applications in art, printing, and digital displays.
                    """)
                    
                    // Artistic Relationship to Color
                    SectionHeader(text: "Artistic Relationship to Color")
                    BodyText(content: """
                    Artists use color theory to evoke emotion, direct attention, and create meaning in their work. The interplay of hue, saturation, and brightness allows for limitless variations. Several art movements emphasize color:
                    
                    •   Impressionism: Artists like Claude Monet used color to capture light and atmosphere.
                    •   Fauvism: Henri Matisse and others employed bold, vibrant colors for emotional expression.
                    •   Expressionism: Color was used to represent deep emotional states rather than realistic scenes.
                    """)
                    
                    // Example: Complementary Colors
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Example: Complementary Colors")
                            .font(.headline)
                            .fontDesign(.serif)
                            .foregroundColor(.accentColor)
                        
                        HStack(spacing: 12) {
                            Circle().fill(.red).frame(width: 50, height: 50)
                            Circle().fill(.green).frame(width: 50, height: 50)
                            Circle().fill(.blue).frame(width: 50, height: 50)
                            Circle().fill(.orange).frame(width: 50, height: 50)
                        }
                        Text("""
                        Complementary colors are opposite each other on the color wheel (e.g., red and green, blue and orange). They create high contrast and energy when placed together, often used to draw attention or highlight specific elements.
                        """)
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                        .fontDesign(.serif)
                    }
                    .padding(.vertical)
                    
                    // Interactive Section
                    SectionHeader(text: "Interactive Color Playground")
                    BodyText(content: """
                    Use the sliders below to adjust the Hue, Saturation, and Brightness of a color. Notice how the complementary color changes as well!
                    """)
                    
                    // Current and Complement Colors
                    HStack(spacing: 24) {
                        VStack {
                            Text("Current Color")
                                .font(.subheadline)
                                .fontDesign(.serif)
                                .foregroundColor(.secondary)
                            Circle()
                                .fill(currentColor)
                                .frame(width: 60, height: 60)
                                .shadow(radius: 4)
                        }
                        
                        VStack {
                            Text("Complementary Color")
                                .font(.subheadline)
                                .fontDesign(.serif)
                                .foregroundColor(.secondary)
                            Circle()
                                .fill(complementaryColor)
                                .frame(width: 60, height: 60)
                                .shadow(radius: 4)
                        }
                    }
                    .padding(.vertical, 8)
                    
                    // Sliders
                    VStack(alignment: .leading, spacing: 20) {
                        VStack(alignment: .leading) {
                            Text("Hue: \(String(format: "%.2f", hue))")
                                .fontDesign(.serif)
                            Slider(value: $hue, in: 0...1)
                                .accentColor(currentColor)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Saturation: \(String(format: "%.2f", saturation))")
                                .fontDesign(.serif)
                            Slider(value: $saturation, in: 0...1)
                                .accentColor(currentColor)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Brightness: \(String(format: "%.2f", brightness))")
                                .fontDesign(.serif)
                            Slider(value: $brightness, in: 0...1)
                                .accentColor(currentColor)
                        }
                    }
                    .padding(.bottom, 24)
                }
                .padding(.horizontal, 24)
            }
        }
       
        // Optional: Hide default nav bar if you want to style your own
        // .navigationBarHidden(true)
    }
}

/// A helper view for section headers, styled consistently throughout the blog.
fileprivate struct SectionHeader: View {
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(text)
                .font(.title2)
                .fontWeight(.semibold)
                .fontDesign(.serif)
                .foregroundColor(.accentColor)
            Divider().padding(.trailing, 100)
        }
    }
}

/// A helper view for body text paragraphs, keeping text styling consistent.
fileprivate struct BodyText: View { // Renamed to follow Swift naming conventions
    let content: String
    
    var body: some View {
        Text(content)
            .fontWeight(.medium)
            .fontDesign(.serif)
            .foregroundColor(.primary)
            .multilineTextAlignment(.leading)
    }
}

/// A preview provider for `ColorTheoryView`, enabling visualization in Xcode's canvas.
struct ColorTheoryView_Previews: PreviewProvider {
    static var previews: some View {
        ColorTheoryView()
    }
}

