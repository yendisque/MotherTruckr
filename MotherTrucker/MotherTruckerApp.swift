//
//  MotherTruckerApp.swift
//  MotherTrucker
//
//  Created by Jason Coawette on 2/3/22.
//

import SwiftUI

@main
struct MotherTruckerApp: App
{
    @StateObject var authentication = Authentication()
    var body: some Scene
    {
        WindowGroup
        {
            GeometryReader { geo in
                if authentication.isValidated
                {
                    HomeView()
                        .environmentObject(authentication)
                } else {
                    LandingView(screenWidth: geo.size.width, screenHeight: geo.size.height)
                        .environmentObject(authentication)
                }
            }
        }
    }
}
