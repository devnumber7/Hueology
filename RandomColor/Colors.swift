//
//  Colors.swift
//  RandomColor
//
//  Created by Aryan Palit on 1/9/25.
//

import SwiftUI
import UIKit


extension Color {
    func toHexString() -> String {
        //convert color to uiColor
        let uiColor = UIColor(self)
        
        //get the rgb components
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let hex = String(format: "#%02lX%02lX%02lX",
                         lround(Double(red) * 255),
                         lround(Double(green) * 255),
                         lround(Double(blue) * 255))
        
        return hex
        
    }
}



