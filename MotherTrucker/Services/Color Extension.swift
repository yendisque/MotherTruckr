//
//  Color Extension.swift
//  MotherTrucker
//
//  Created by Jason Coawette on 2/8/22.
//

import SwiftUI

// Color Hex
extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}


extension Color {
    static let BackgroundBlack = Color(hex: 0x262626)
}
