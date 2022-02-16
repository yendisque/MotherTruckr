//
//  ButtonView.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 2/8/22.
//

import SwiftUI

struct ButtonView: View {
    var text:String
    var width:CGFloat
    var height:CGFloat
    @State var disabled: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            Text(text)
                .fontWeight(.semibold)
                .font(.title)
                .frame(width: round(width * 0.7632), height: round(height * 0.0762))
                .foregroundColor(disabled ? .secondary : .primary)
                .accentColor(.black)
                .background(Color.white)
                .cornerRadius(30)
                .shadow(radius: 4, y: 4)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            ButtonView(text: "Button", width: geo.size.width, height: geo.size.height, disabled: false)
        }
    }
}
