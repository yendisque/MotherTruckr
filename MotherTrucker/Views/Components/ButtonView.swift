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
        VStack {
            Text(text)
                .fontWeight(.semibold)
                .font(.title)
                .frame(width: round(width * 0.3623), height: round(height * 0.02869))
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
        ButtonView(text: "Button", width: 828, height: 1917, disabled: false)
    }
}
