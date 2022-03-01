//
//  FirstLandingView.swift
//  MotherTrucker
//
//  Created by Jason Coawette on 2/9/22.
//

import SwiftUI
/*
MARK: Ok so try to avoid relying on .offset() to position elements in the view. This is because it does not scale well ultimately and makes the UI hard to manage and maintain. It also becomes are to dynamically fit the layout to other phone screen sizes because they all use the offset values for the device you were testing them on.
 Instead use Spacers(), .padding(), and VStack/HStack/ZStacks to create the layout
 
 Lets make transitions better when transitioning between screens
*/
struct LandingView: View {
    var screenWidth, screenHeight: CGFloat
    
    var body: some View {
        NavigationView {
            LandingContent(width: screenWidth, height: screenHeight)
        }.ignoresSafeArea(.all)
    }
}

struct LandingContent: View {
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

                    NavigationLink(destination: LoginView(screenWidth: width, screenHeight: height)) {
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
            LandingView(screenWidth: geo.size.width, screenHeight: geo.size.height)
        }
    }
}
