//
//  MotherTruckerApp.swift
//  MotherTrucker
//
//  Created by Jason Coawette on 2/3/22.
//

import SwiftUI

@main
struct MotherTruckerApp: App {
    @StateObject var authentication = Authentication()
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            GeometryReader { geo in
                if authentication.isValidated {
                    RoutingView(viewRouter: viewRouter, width: geo.size.width, height: geo.size.height)
                        .environmentObject(authentication)
                } else {
                    LandingView(viewRouter: viewRouter, screenWidth: geo.size.width, screenHeight: geo.size.height)
                        .environmentObject(authentication)
                }
            }
        }
    }
}
