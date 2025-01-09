//
//  ContentView.swift
//  RandomColor
//
//  Created by Aryan Palit on 1/8/25.
//

import SwiftUI
import SwiftData


/// A view model that manages the state and logic for generating and copying random colors.
class ContentViewModel: ObservableObject {
    /// The current background color displayed in the view.
    @Published var backgroundColor: Color = .white
    
    /// An optional message displayed when a color is copied to the clipboard.
    @Published var copiedmessage: String? = ""
    
    
    
    /// Generates a random color with random hue, saturation, and brightness values.
        ///
    /// - Returns: A `Color` instance with random hue, saturation, and brightness.
    func randomColorGen() -> Color{
        Color.init(hue: Double.random(in: 0...1), saturation: Double.random(in: 0...1), brightness: Double.random(in: 0...1))
    }
}


struct colorGenView : View {
    @StateObject private var viewModel = ContentViewModel()
    var body: some View {
        
        HStack(spacing: 20) {
            Text(viewModel.backgroundColor.toHexString())
                .fontWeight(Font.Weight.black)
                .font(.headline)
            // Display an SF Symbol
            
            Button(action: {
                UIPasteboard.general.string = viewModel.backgroundColor.toHexString()
                viewModel.copiedmessage = "Color copied to clipboard!"
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    viewModel.copiedmessage = ""
                    
                })
                
            }){
                // Icon for the button
                Image(systemName: "pencil.and.list.clipboard")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
               
                    
            }
            
            if let message = viewModel.copiedmessage{
                Text(message)
                    .font(.caption)
                
            }
            
            
            
        }
       
       
        viewModel.backgroundColor.ignoresSafeArea()

        //Text("All the colors to choose from!!!")
            ZStack{
                
                Button("Generate a Random Color") {
                    viewModel.backgroundColor = viewModel.randomColorGen()
                }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle)
                    .controlSize(.large)
                    .fontWeight(.black)
                
          
            }
            .navigationBarBackButtonHidden(false)
        
        }
}


#Preview{
    colorGenView()
}
