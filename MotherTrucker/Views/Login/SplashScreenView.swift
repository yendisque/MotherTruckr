//
//  ContentView.swift
//  MotherTrucker
//
//  Created by Jason Coawette on 2/3/22.
//

import SwiftUI

// Splash Screen
struct SplashScreenView: View {
    @State var animate = false
    @State var endSplash = false
    //var screenWidth:CGFloat
    //var screenHeight: CGFloat
    
    var body: some View {
        ZStack {
            //LoginView(screenWidth: screenWidth, screenHeight: screenHeight)
            
            ZStack {
                LinearGradient(gradient: Gradient(colors: [ Color(hex: 0x7BED9F), Color(hex: 0x07C656) ]), startPoint: .topLeading, endPoint: .bottomTrailing)
                
                Image("Truck")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width: animate ? nil : 30, height: animate ? nil : 30)
                
                // scaling the view
                .scaleEffect(animate ? 3 : 1)
                .frame(width: UIScreen.main.bounds.width)
                
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: animateSplash)
            .opacity(endSplash ? 0 : 1)
        }
    }
    
    func animateSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            withAnimation(Animation.easeOut(duration: 0.45)) {
                animate.toggle()
            }
            withAnimation(Animation.linear(duration: 0.35)) {
                endSplash.toggle()
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
