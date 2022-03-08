//
//  FirstLandingView.swift
//  MotherTrucker
//
//  Created by Jason Coawette on 2/9/22.
//

import SwiftUI

struct LandingView: View {
    @StateObject var viewRouter: ViewRouter
    @EnvironmentObject var authentication: Authentication
    var screenWidth, screenHeight: CGFloat
    
    var body: some View {
        NavigationView {
            LandingContent(viewRouter: viewRouter, width: screenWidth, height: screenHeight)
        }.ignoresSafeArea(.all)
        .environmentObject(authentication)
    }
}

struct LandingContent: View {
    @EnvironmentObject var authentication: Authentication
    @StateObject var viewRouter: ViewRouter
    var width, height: CGFloat
    @State private var isShowingLogin = false
    @State private var isShowingSignup = false
    
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
                    Button {
                        isShowingSignup.toggle()
                    } label: {
                        ButtonView(text: "Sign Up", width: width, height: height, disabled: false)
                    }.sheet(isPresented: $isShowingSignup) {
                        NavigationView {
                            SignupView(showingModal: $isShowingSignup, width: width, height: height)
                        }.environmentObject(authentication)
                    }.padding(.bottom, 20)
                    
                    Text("Already have an account?")
                    
                    Button {
                        isShowingLogin.toggle()
                    } label: {
                        ButtonView(text: "Login", width: width, height: height, disabled: false)
                    }.sheet(isPresented: $isShowingLogin) {
                        LoginView(showingModal: $isShowingLogin, viewRouter: viewRouter, screenWidth: width, screenHeight: height)
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
