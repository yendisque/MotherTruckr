//
//  MenuView.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 3/10/22.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ZStack {
            Color(hex: 0x2ED573)
                .ignoresSafeArea()
            
            // Side Menu
            DrawerView()
        }
    }
}

struct MenuView_Preview: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
