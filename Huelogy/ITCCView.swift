//
//  IntroToComputingColors.swift
//  Hueology
//
//  Created by Aryan Palit on 1/12/25.
//


import SwiftUI

struct IntroToComputingColorsViews: View {
    var body: some View {
        ZStack {
            // Background Gradient
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
                    Text("Introduction to Colors in Computers")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .shadow(color: .blue.opacity(0.5), radius: 10, x: 0, y: 5)
                        .padding(.top, 32)
                    
                    // SECTION 1: Overview
                    SectionCard(title: "Why Colors Matter in Computing") {
                        Text("""
Colors are integral to how we interpret digital content—from websites and applications to videos and games. In computing, colors are represented through numerical models that dictate how they appear on screen or in print.

• **Perception:** Our eyes contain photoreceptors (cones and rods) that detect different wavelengths of light.
• **Devices:** Different devices (monitors, printers, TVs) use different color models for the best results in their respective mediums.
• **Color Consistency:** Knowledge of color models helps ensure consistent, accurate color representation across multiple platforms.
""")
                    }
                    
                    // SECTION 2: Core Color Models
                    SectionCard(title: "Core Color Models") {
                        Text("""
1. **RGB (Red, Green, Blue)**:
   • Additive model: Colors are created by mixing light.
   • Used in digital screens (computers, TVs, smartphones).
   • Each channel typically ranges from 0 to 255 (e.g., (255, 0, 0) = pure red).

2. **CMYK (Cyan, Magenta, Yellow, Key/Black)**:
   • Subtractive model: Colors are created by absorbing light and reflecting what remains.
   • Primarily used in printing.
   • Black (K) is added to improve contrast and reduce ink usage.

3. **HSB / HSV (Hue, Saturation, Brightness/Value)**:
   • Represents color in terms closer to human perception.
   • Hue is the 'base' color, Saturation is color intensity, Brightness/Value is how light or dark a color is.
   • Common in design tools for intuitive color picking.

4. **Hexadecimal Codes**:
   • Often used in web development.
   • Format: #RRGGBB (hex values for red, green, blue).
   • Example: #FFFFFF = White, #000000 = Black.

5. **Other Models**:
   • **LAB**: Separates lightness (L) from color components (A/B), useful in advanced photo editing.
   • **YUV / YCbCr**: Used in video encoding and broadcasting.
""")
                    }
                    
                    // SECTION 3: Java Code Snippet
                    SectionCard(title: "Java Example: Parsing Colors") {
                        Group{
                            Text("""
    Below is a simple Java code snippet that demonstrates how to parse a HEX string into a `Color` object, then retrieve the individual RGB components.
    """)
                            .padding(.bottom, 8)
                            
                            // Code Snippet (Rendered as text)
                            CodeSnippet(code: """
    public class ColorParsingExample {
        public static void main(String[] args) {
            // Example HEX color string:
            String hexColor = "#FF5733"; // A bright orange-red
            
            // Parse the string into a Java AWT Color object
            java.awt.Color color = java.awt.Color.decode(hexColor);
            
            // Extract RGB values
            int red   = color.getRed();
            int green = color.getGreen();
            int blue  = color.getBlue();
            
            System.out.println("Parsed Color -> R: " + red + ", G: " + green + ", B: " + blue);
        }
    }
    """)
                            
                        }
                       
                    }

                    // SECTION 4: Applications & Wrap-Up
                    SectionCard(title: "Real-World Applications") {
                        Text("""
• **Design & Development**: Web, app, and graphic designers rely on accurate color models (RGB, Hex, HSB) to craft consistent user interfaces.
• **Printing**: CMYK ensures that the final print matches on-screen designs as closely as possible.
• **Video & Gaming**: Models like YCbCr (and its variants) are used for encoding and efficiently transmitting video signals.
• **Accessibility**: Understanding color models helps in creating accessible color palettes for color-blind users or those with low-vision impairments.
                        
By mastering these models, developers, designers, and content creators can produce vibrant, accurate, and consistent digital experiences.
""")
                    }
                    
                    Spacer().frame(height: 40)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 40)
            }
        }
    }
}




#Preview {
    IntroToComputingColorsViews()
}
