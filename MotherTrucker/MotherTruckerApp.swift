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
            if authentication.isValidated
            {
                HomeView()
                    .environmentObject(authentication)
            } else {
                LoginView()
                    .environmentObject(authentication)
            }
        }
    }
}
