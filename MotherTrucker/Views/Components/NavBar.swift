//
//  NavBar.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 2/9/22.
//

import SwiftUI

struct NavBar: ToolbarContent {
    var body: some ToolbarContent {
        ToolbarItem(placement: .destructiveAction) {
            BackButton()
        }
    }
}

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "arrow.turn.up.left")
                .font(.system(size: 20))
        }.buttonStyle(.plain)
    }
}

struct BackButton_Preview: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
