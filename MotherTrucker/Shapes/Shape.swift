//
//  Shape.swift
//  MotherTrucker
//
//  Created by Jason Coawette on 2/8/22.
//

import SwiftUI

struct CustomShape: Shape {
    var width, height: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let offset = round(height * 0.0492)
        
        return Path { path in

            path.move(to: CGPoint(x: width, y: height / 2))
            path.addLine(to: CGPoint(x: width, y: height + offset))
            path.addLine(to: CGPoint(x: 0, y: height + offset))
            path.addLine(to: CGPoint(x: 0, y: height / 1.8))
            path.addLine(to: CGPoint(x: width, y: height / 3))
            
            path.closeSubpath()
        }
    }
}

struct Triangle_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            VStack(alignment: .center) {
                CustomShape(width: geo.size.width, height: geo.size.height)
            }
        }
    }
}
