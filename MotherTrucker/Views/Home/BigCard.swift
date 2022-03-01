//
//  BigCard.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 2/15/22.
//

import SwiftUI

struct BigCard: View {
    var width, height: CGFloat
    
    var body: some View {
        ZStack {
            Image("howitworks")
            Text("Here's How It Works")
                .fontWeight(.bold)
                .font(.system(size: 30))
                .frame(width: 170, height: 72)
                .foregroundColor(.white)
                .padding(.bottom, 240)
                .padding(.trailing, 150)
        }
        .frame(width: round(width * 0.8695), height: round(height * 0.4054))
        .cornerRadius(20)
    }
}

struct BigCard_Preview: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            BigCard(width: geo.size.width, height: geo.size.height)
        }
    }
}
