//
//  MenuView.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 3/10/22.
//

import SwiftUI

struct MenuView: View {
    var width, height: CGFloat
    @Binding var confirmLogout: Bool
    
    var body: some View {
        ZStack {
            Color(hex: 0x2ED573)
                .ignoresSafeArea()
            
            // Side Menu
            DrawerView(width: width, height: height, confirmLogout: $confirmLogout)
        }
    }
}

//struct MenuView_Preview: PreviewProvider {
//    static var previews: some View {
//        MenuView()
//    }
//}
