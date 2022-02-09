//
//  ButtonView.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 2/8/22.
//

import SwiftUI

struct ButtonView: View {
    @State var disabled: Bool
    
    var body: some View {
        Text("Log In")
            .font(.largeTitle)
            .frame(width: 316, height: 62)
            .foregroundColor(disabled ? .secondary : .primary)
            .background(Color.white)
            .cornerRadius(30)
            .shadow(radius: 4, y: 4)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(disabled: true)
    }
}
