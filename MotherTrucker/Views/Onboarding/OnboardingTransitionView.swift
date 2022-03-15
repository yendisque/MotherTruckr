//
//  OnboardingTransitionView.swift
//  MotherTrucker
//
//  Created by Jason Coawette on 2/17/22.
//

import SwiftUI

// This View makes it onboaring screens only show once.
struct OnboaringTransitionView: View{
    var width, height: CGFloat
    @State var onboarding: Bool
    @StateObject var viewRouter = ViewRouter()
    @State var x = true // ignore this variable for now
    @State var showMenu: Bool
    
    var body: some View{
        VStack {
            if onboarding {
                OnboardingView(showingModal: $x, width: width, height: height)
            } else {
                HomeView(viewRouter: viewRouter, width: width, height: height, showSideMenu: $showMenu)
                    .transition(.move(edge: .trailing))
            }
        }
        .animation(.easeIn, value: onboarding)
    }
}
