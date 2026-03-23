//
//  Color+Extension.swift
//  gymx
//
//  Created by Mustafa Ghazi on 23/11/25.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255,
                            (int >> 8) * 17,
                            (int >> 4 & 0xF) * 17,
                            (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255,
                            int >> 16,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24,
                            int >> 16 & 0xFF,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }

}

extension LinearGradient {
    static let purpleLinear = LinearGradient(colors: [
             Color(hex: "C58BF2"),
             Color(hex: "EEA4CE")
         ], startPoint: .topLeading, endPoint: .bottomTrailing)
    static let blueLinear = LinearGradient(colors: [
             Color(hex: "9DCEFF"),
             Color(hex: "92A3FD")
         ], startPoint: .topLeading, endPoint: .bottomTrailing)
    static let clear = LinearGradient(colors: [.clear,.clear], startPoint: .topLeading, endPoint: .bottomTrailing)
    static let gray2 = LinearGradient(colors: [Color(hex: "ADA4A5")], startPoint: .top, endPoint: .bottom)
     
}
