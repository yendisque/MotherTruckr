//
//  LandingPage.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 2/9/22.
//

import SwiftUI

struct LandingView: View {
    var screenWidth: CGFloat
    var screenHeight: CGFloat
    
    var body: some View {
        NavigationView {
//            Text("Landing View")
            LoginView(screenWidth: screenWidth, screenHeight: screenHeight)
        }
    }
}

struct LandingView_Preview: PreviewProvider {
    static var previews: some View {
        LandingView(screenWidth: 828, screenHeight: 1917)
    }
}
