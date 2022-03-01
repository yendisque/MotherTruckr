//
//  FirstLandingView.swift
//  MotherTrucker
//
//  Created by Jason Coawette on 2/9/22.
//

import SwiftUI

struct LandingView: View {
    @StateObject var viewRouter: ViewRouter
    var screenWidth, screenHeight: CGFloat
    
    var body: some View {
        NavigationView {
            LandingContent(viewRouter: viewRouter, width: screenWidth, height: screenHeight)
        }.ignoresSafeArea(.all)
    }
}

struct LandingContent: View {
    @StateObject var viewRouter: ViewRouter
    var width, height: CGFloat
    
    var body: some View {
        ZStack {
            BackgroundTriangle(width: width, height: height)
                .offset(x: 3, y: round(height * 0.092))
            VStack {
                TitleText(text: "The Future of Supply")
                    .frame(width: 200, height: 200)
                    .padding(.top, 80)
                    .padding(.trailing, 170)
                    .padding(.leading, 20)

                Image("FirstLandingViewImage")
                    .resizable()
                    .frame(width: 420, height: 265)
                    .padding(.top, 100)

                VStack {
                    NavigationLink(destination: SignupView(width: width, height: height)) {
                        ButtonView(text: "Sign Up", width: width, height: height, disabled: false)
                    }.padding(.bottom, 20)
                    
                    Text("Already have an account?")

                    NavigationLink(destination: LoginView(viewRouter: viewRouter, screenWidth: width, screenHeight: height)) {
                        // The disabled argument should be connected with the backend at some point, not sure
                        // I've just arbitarily set it to false right now
                        ButtonView(text: "Login", width: width, height: height, disabled: false)
                    }
                    Spacer()
                }
                .padding(.bottom, 210)
                
            
            }
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            LandingView(viewRouter: ViewRouter(), screenWidth: geo.size.width, screenHeight: geo.size.height)
        }
    }
}
