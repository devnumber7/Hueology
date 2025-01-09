//
//  LearnView.swift
//  RandomColor
//
//  Created by Aryan Palit on 1/9/25.
//

import SwiftUI

struct ColorTheoryView: View {
    
    // MARK: - Interactive Color State
    @State private var hue: Double = 0.0
    @State private var saturation: Double = 0.5
    @State private var brightness: Double = 0.8
    
    // Computed property for main color
    private var currentColor: Color {
        Color(hue: hue, saturation: saturation, brightness: brightness)
    }
    
    // Computed property for complementary color
    private var complementaryColor: Color {
        // Add 0.5 (180 degrees on the hue wheel) to get the complementary hue
        let complementaryHue = (hue + 0.5).truncatingRemainder(dividingBy: 1.0)
        return Color(hue: complementaryHue,
                     saturation: saturation,
                     brightness: brightness)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // MARK: - Title
                Text("Introduction to Color Theory")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top)
                
                // MARK: - Basics of Color Theory
                Text("Basics of Color Theory")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text("""
                Color theory is a set of principles used to create harmonious and visually appealing combinations of colors. It explores how colors interact, their psychological effects, and their cultural significance. At its core, color theory consists of:
                • The color wheel (based on primary, secondary, and tertiary colors)
                • Concepts like complementary, analogous, and triadic color schemes
                • Methods to balance contrast, warmth, and coolness
                """)
                
                // MARK: - Color and Psychology
                Text("Color and Psychology")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text("""
                Colors have a profound impact on human psychology and can influence our emotions, behaviors, and perceptions. Here are a few examples:
                • **Red** can evoke feelings of passion, energy, or urgency.
                • **Blue** is often associated with calmness, trust, and reliability.
                • **Yellow** tends to represent happiness, optimism, and cheerfulness.
                • **Green** can symbolize nature, growth, or freshness.
                
                These emotional associations are used in marketing, design, and branding to subtly guide consumer behavior and shape mood.
                """)
                
                // MARK: - Scientific Basis of Color
                Text("Scientific Basis of Color")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text("""
                Scientifically, color is the result of light (electromagnetic waves) interacting with the human eye. The visible spectrum of light ranges from red (long wavelengths) to violet (short wavelengths). 
                
                • **Isaac Newton** demonstrated that white light splits into a spectrum of colors through a prism, showing all colors are present in white light.
                • The human eye contains **cones** that perceive color (red, green, blue) and **rods** that detect light intensity.
                • Different color models exist (RGB, CMYK, HSB, etc.) for various applications in art, printing, and digital displays.
                """)
                
                // MARK: - Artistic Relationship to Color
                Text("Artistic Relationship to Color")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text("""
                Artists use color theory to evoke emotion, direct attention, and create meaning in their work. The interplay of hue, saturation, and brightness allows for limitless variations. Several art movements emphasize color:
                
                • **Impressionism**: Artists like Claude Monet used color to capture light and atmosphere.
                • **Fauvism**: Henri Matisse and others employed bold, vibrant colors for emotional expression.
                • **Expressionism**: Color was used to represent deep emotional states rather than realistic scenes.
                """)
                
                // MARK: - Example: Complementary Colors
                VStack(alignment: .leading, spacing: 10) {
                    Text("Example: Complementary Colors")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    HStack {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 50, height: 50)
                        
                        Circle()
                            .fill(Color.green)
                            .frame(width: 50, height: 50)
                        
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 50, height: 50)
                        
                        Circle()
                            .fill(Color.orange)
                            .frame(width: 50, height: 50)
                    }
                    Text("""
                    Complementary colors are opposite each other on the color wheel (e.g., red and green, blue and orange). They create high contrast and energy when placed together, often used to draw attention or highlight specific elements.
                    """)
                    .fontWeight(.light)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                }
                .padding(.vertical)
                
                // MARK: - Interactive Color Playground
                Text("Interactive Color Playground")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text("""
                Use the sliders below to adjust the Hue, Saturation, and Brightness of a color. Notice how the complementary color changes as well!
                """)
                
                // Display the main color and its complement side by side
                HStack {
                    VStack {
                        Text("Current Color")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Circle()
                            .fill(currentColor)
                            .frame(width: 80, height: 80)
                    }
                    Spacer()
                    VStack {
                        Text("Complement")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Circle()
                            .fill(complementaryColor)
                            .frame(width: 80, height: 80)
                    }
                }
                .padding(.vertical, 8)
                
                // Sliders to adjust H, S, B
                VStack(alignment: .leading, spacing: 12) {
                    Text("Hue: \(String(format: "%.2f", hue))")
                    Slider(value: $hue, in: 0...1)
                    
                    Text("Saturation: \(String(format: "%.2f", saturation))")
                    Slider(value: $saturation, in: 0...1)
                    
                    Text("Brightness: \(String(format: "%.2f", brightness))")
                    Slider(value: $brightness, in: 0...1)
                }
                .padding(.bottom)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Color Theory")
    }
}

struct ColorTheoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ColorTheoryView()
        }
    }
}
