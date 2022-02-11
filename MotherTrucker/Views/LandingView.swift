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
*/
struct LandingView: View {
    var screenWidth, screenHeight: CGFloat
    
    var body: some View {
        ZStack {
            BackgroundTriangle()
            VStack {
                Text("The Future of Supply")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .multilineTextAlignment(.leading)
                    .frame(width: 200, height: 200)
                    .dynamicTypeSize(.accessibility1)
                    .padding(.top, 80)
                    .padding(.trailing, 150)

                Image("FirstLandingViewImage")
                    .resizable()
                    .frame(width: 420, height: 265)
                    .padding()

                Text("Already have an account?")

                NavigationLink(destination: LoginView(screenWidth: screenWidth, screenHeight: screenHeight)) {
                    // The disabled argument should be connected with the backend at some point, not sure
                    // I've just arbitarily set it to false right now
                    ButtonView(text: "Login", width: screenWidth, height: screenHeight, disabled: false)
                }
                .padding(.bottom, 200)
            }
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView(screenWidth: 828, screenHeight: 1917)
    }
}
