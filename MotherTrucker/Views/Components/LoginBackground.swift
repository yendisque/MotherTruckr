//
//  LoginBackground.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 2/9/22.
//

import SwiftUI

struct BackgroundTriangle: View
{
    var body: some View {
        VStack(alignment: .center) {
            Triangle()
                .stroke(Color.blue, lineWidth: 0)
                .background(
                    Triangle()
                        .fill(
                            LinearGradient(gradient:Gradient(colors: [Color(hex: 0x2ED573),
                                                                      Color(hex: 0x7BED9F)]),
                                           startPoint: .bottomTrailing, endPoint: .topLeading)
                        )
                )
                .frame(width: 2000.0, height: 1000.0)
            Spacer().frame(height: 120)
        }.offset(y:1)
    }
}

struct BackgroundTriangle_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundTriangle()
    }
}
