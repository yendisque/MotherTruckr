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
    
    var body: some View{
       
        VStack{
            
            if onboarding {
                OnboardingView(width: width, height: height)
            } else {
                HomeView(width: width, height: height)
                    .transition(.move(edge: .trailing))
            
                
                
            }
        }
        .animation(.easeIn, value: onboarding)
    }
}
