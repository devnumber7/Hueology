//
//  LearnView.swift
//  RandomColor
//
//  Created by Aryan Palit on 1/9/25.
//

import SwiftUI

/// A view that introduces users to color theory concepts and provides an interactive playground to explore color relationships.
struct ColorTheoryView: View {
    
    /// The hue component of the interactive color, ranging from 0.0 to 1.0.
    @State private var hue: Double = 0.0
    
    /// The saturation component of the interactive color, ranging from 0.0 to 1.0.
    @State private var saturation: Double = 0.5
    
    /// The brightness component of the interactive color, ranging from 0.0 to 1.0.
    @State private var brightness: Double = 0.8
    
    /// The currently selected color based on hue, saturation, and brightness.
    private var currentColor: Color {
        Color(hue: hue, saturation: saturation, brightness: brightness)
    }
    
    /// The complementary color of the currently selected color, calculated by shifting the hue by 0.5 (180 degrees) on the color wheel.
    private var complementaryColor: Color {
        let complementaryHue = (hue + 0.5).truncatingRemainder(dividingBy: 1.0)
        return Color(hue: complementaryHue,
                     saturation: saturation,
                     brightness: brightness)
    }
    
    /// The main body of the `ColorTheoryView`, containing educational content and interactive elements.
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                /// Title introducing the color theory section.
                Text("Introduction to Color Theory")
                    .font(.title)
                    .fontWeight(.bold)
               
                    .padding(.top)
                
                /// Section heading for the basics of color theory.
                Text("Basics of Color Theory")
                    .font(.title2)
                    .fontWeight(.semibold)
                   
                
                /// Description of fundamental color theory concepts.
                Text("""
                Color theory is a set of principles used to create harmonious and visually appealing combinations of colors. It explores how colors interact, their psychological effects, and their cultural significance. At its core, color theory consists of:
                • The color wheel (based on primary, secondary, and tertiary colors)
                • Concepts like complementary, analogous, and triadic color schemes
                • Methods to balance contrast, warmth, and coolness
                """)
                
                /// Section heading for the psychological impact of colors.
                Text("Color and Psychology")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                /// Explanation of how different colors affect human emotions and behaviors.
                Text("""
                Colors have a profound impact on human psychology and can influence our emotions, behaviors, and perceptions. Here are a few examples:
                • **Red** can evoke feelings of passion, energy, or urgency.
                • **Blue** is often associated with calmness, trust, and reliability.
                • **Yellow** tends to represent happiness, optimism, and cheerfulness.
                • **Green** can symbolize nature, growth, or freshness.
                
                These emotional associations are used in marketing, design, and branding to subtly guide consumer behavior and shape mood.
                """)
                
                /// Section heading for the scientific understanding of color.
                Text("Scientific Basis of Color")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                /// Description of the physical and biological aspects of color perception.
                Text("""
                Scientifically, color is the result of light (electromagnetic waves) interacting with the human eye. The visible spectrum of light ranges from red (long wavelengths) to violet (short wavelengths). 
                
                • **Isaac Newton** demonstrated that white light splits into a spectrum of colors through a prism, showing all colors are present in white light.
                • The human eye contains **cones** that perceive color (red, green, blue) and **rods** that detect light intensity.
                • Different color models exist (RGB, CMYK, HSB, etc.) for various applications in art, printing, and digital displays.
                """)
                
                /// Section heading for the artistic use of color.
                Text("Artistic Relationship to Color")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                /// Explanation of how artists utilize color theory to convey emotions and meanings.
                Text("""
                Artists use color theory to evoke emotion, direct attention, and create meaning in their work. The interplay of hue, saturation, and brightness allows for limitless variations. Several art movements emphasize color:
                
                • **Impressionism**: Artists like Claude Monet used color to capture light and atmosphere.
                • **Fauvism**: Henri Matisse and others employed bold, vibrant colors for emotional expression.
                • **Expressionism**: Color was used to represent deep emotional states rather than realistic scenes.
                """)
                
                /// Example section demonstrating complementary colors with visual representations.
                VStack(alignment: .leading, spacing: 10) {
                    Text("Example: Complementary Colors")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    /// Display of colored circles representing complementary colors.
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
                    
                    /// Description of complementary colors and their visual impact.
                    Text("""
                    Complementary colors are opposite each other on the color wheel (e.g., red and green, blue and orange). They create high contrast and energy when placed together, often used to draw attention or highlight specific elements.
                    """)
                    .fontWeight(.light)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                }
                .padding(.vertical)
                
                /// Section heading for the interactive color playground.
                Text("Interactive Color Playground")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                /// Instructional text guiding users to interact with color sliders.
                Text("""
                Use the sliders below to adjust the Hue, Saturation, and Brightness of a color. Notice how the complementary color changes as well!
                """)
                
                /// Display of the current color and its complementary color.
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
                
                /// Sliders allowing users to adjust hue, saturation, and brightness of the color.
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
    }
}

/// A preview provider for `ColorTheoryView`, enabling visualization in Xcode's canvas.
struct ColorTheoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ColorTheoryView()
        }
    }
}
