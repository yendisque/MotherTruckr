//
//  Shape.swift
//  MotherTrucker
//
//  Created by Jason Coawette on 2/8/22.
//

import SwiftUI

struct Triangle: Shape
{
    func path(in rect: CGRect) -> Path
    {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

struct Triangle_Previews: PreviewProvider {
    static var previews: some View {
        Triangle()
            .stroke(Color.blue, lineWidth: 2)
            .frame(width: 300.0, height: 300.0)
    }
}
