//
//  LoginBackground.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 2/9/22.
//

import SwiftUI

struct BackgroundTriangle: View {
    var width, height: CGFloat
    
    var body: some View {
        VStack(alignment: .center) {
            CustomShape(width: width, height: height)
                .stroke(Color.blue, lineWidth: 0)
                .background(
                    CustomShape(width: width, height: height)
                        .fill(
                            LinearGradient(gradient:Gradient(colors: [Color(hex: 0x2ED573),
                                                                      Color(hex: 0x7BED9F)]),
                                           startPoint: .bottomTrailing, endPoint: .topLeading)
                        )
                )
        }
    }
}

struct BackgroundTriangle_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            BackgroundTriangle(width: geo.size.width, height: geo.size.height)
        }
    }
}
