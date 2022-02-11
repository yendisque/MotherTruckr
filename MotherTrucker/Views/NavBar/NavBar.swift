//
//  NavBar.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 2/9/22.
//

import SwiftUI

struct NavBar: ToolbarContent {
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            TitleView()
        }
//        ToolbarItem(placement: .destructiveAction) {
//            // Buttons go here i think
//        }
    }
}

struct TitleView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Spacer().frame(height: 50)
            Text("Welcome")
                .fontWeight(.bold)
                .font(.system(size: 40))
            Text("Back!")
                .fontWeight(.bold)
                .font(.system(size: 40))
        }
        .padding(.leading)
        .padding(.top)
    }
}

struct TitleView_Preview: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
