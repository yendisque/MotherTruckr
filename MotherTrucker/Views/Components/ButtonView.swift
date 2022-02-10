//
//  ButtonView.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 2/8/22.
//

import SwiftUI

struct ButtonView: View {
    @State var disabled: Bool
    var width:CGFloat
    var height:CGFloat
    
    var body: some View {
        Text("Log In")
//            .font(.largeTitle)
            .font(.system(size: 30))
            .bold()
            .frame(width: round(width * 0.3816), height: round(height * 0.0360))
            .foregroundColor(disabled ? .secondary : .primary)
            .background(Color.white)
            .cornerRadius(30)
            .shadow(radius: 4, y: 4)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(disabled: true, width: 828, height: 1719)
    }
}
