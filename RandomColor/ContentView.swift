//
//  ContentView.swift
//  RandomColor
//
//  Created by Aryan Palit on 1/8/25.
//

import SwiftUI
import SwiftData

class ContentViewModel: ObservableObject {
    @Published var backgroundColor: Color = .white
    @Published var copiedmessage: String? = ""
    
    
    
    
    func randomColorGen() -> Color{
        Color.init(hue: Double.random(in: 0...1), saturation: Double.random(in: 0...1), brightness: Double.random(in: 0...1))
    }
}

struct ContentView : View {
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
                    .foregroundColor(.black)
                    
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
                
          
            }
        }
    
    
    
    //helper method
   
    
   
    
    
}

