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
        ZStack {
            // Background
            RadialGradient(
                gradient: Gradient(colors: [Color.black, Color.purple.opacity(0.8), Color.blue.opacity(0.6)]),
                center: .center,
                startRadius: 50,
                endRadius: 500
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Title
                    Text("Introduction to Color Theory")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 24)
                        .padding(.bottom, 16)
                        .shadow(color: .blue.opacity(0.5), radius: 10, x: 0, y: 5)

                    // Sections
                    Group {
                        SectionCard(title: "Basics of Color Theory") {
                            Text("""
                            Color theory is a set of principles used to create harmonious and visually appealing combinations of colors. It explores:
                            • The color wheel (primary, secondary, and tertiary colors)
                            • Complementary, analogous, and triadic color schemes
                            • Balancing contrast, warmth, and coolness
                            """)
                        }

                        SectionCard(title: "Color and Psychology") {
                            Text("""
                            Colors influence our emotions and perceptions. For example:
                            • Red: Passion, energy, urgency.
                            • Blue: Calmness, trust, reliability.
                            • Yellow: Happiness, optimism.
                            • Green: Nature, growth, freshness.
                            """)
                        }

                        SectionCard(title: "Scientific Basis of Color") {
                            Text("""
                            Color results from light interacting with the human eye. Key concepts:
                            • **Visible Spectrum**: Red (long wavelengths) to violet (short wavelengths).
                            • **Isaac Newton**: Demonstrated the spectrum of white light.
                            • Human eye cones (red, green, blue) and rods (light intensity).
                            """)
                        }
                    }

                    // Interactive Playground
                    SectionCard(title: "Interactive Color Playground") {
                        Group {
                            Text("""
                            Adjust the sliders below to change the Hue, Saturation, and Brightness of a color. Watch how the complementary color updates in real time!
                            """)

                            // Current and Complement Colors
                            HStack(spacing: 24) {
                                VStack {
                                    Text("Current Color")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Circle()
                                        .fill(currentColor)
                                        .frame(width: 60, height: 60)
                                        .shadow(radius: 5)
                                }

                                VStack {
                                    Text("Complementary Color")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Circle()
                                        .fill(complementaryColor)
                                        .frame(width: 60, height: 60)
                                        .shadow(radius: 5)
                                }
                            }
                            .padding(.vertical, 8)

                            // Sliders
                            VStack(spacing: 16) {
                                SliderView(title: "Hue", value: $hue, color: currentColor)
                                SliderView(title: "Saturation", value: $saturation, color: currentColor)
                                SliderView(title: "Brightness", value: $brightness, color: currentColor)
                            }
                        }
                    }

                }
                .padding(.horizontal, 24)
            }
        }
        //.navigationBarHidden(true)
    }
}



// MARK: - SliderView
fileprivate struct SliderView: View {
    let title: String
    @Binding var value: Double
    let color: Color

    var body: some View {
        VStack(alignment: .leading) {
            Text("\(title): \(String(format: "%.2f", value))")
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
            Slider(value: $value, in: 0...1)
                .accentColor(color)
                .shadow(color: color.opacity(0.5), radius: 5)
        }
    }
}

// MARK: - Preview
struct ColorTheoryView_Previews: PreviewProvider {
    static var previews: some View {
        ColorTheoryView()
    }
}


