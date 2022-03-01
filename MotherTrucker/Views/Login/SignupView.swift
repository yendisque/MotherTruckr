//
//  SignupView.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 2/11/22.
//

import SwiftUI

struct SignupView: View {
    @State var emailCreds: String = ""
    @State var passCreds: String = ""
    var width, height: CGFloat
    
    var body: some View {
        ZStack {
            BackgroundTriangle(width: width, height: height)
                .offset(y: round(height * 0.092))
            VStack {
                TitleText(text: "Create an Account")
                    .padding(.trailing, 140)
                    .frame(width: 350, height: 230)
                
                TextArea(placeholder: "Username or Email",
                         text: $emailCreds,
                         width: width, height: height)

                SecureTextArea(placeholder: "Password",
                               text: $passCreds,
                               width: width, height: height)
                    .padding(20)
                
                SecureTextArea(placeholder: "Confirm Password",
                               text: $passCreds,
                               width: width, height: height)
                    .padding(.bottom, 30)
                
                LoginCardView(width: width, height: height)
                    .padding()
                
                Text("By clicking the sign up button, you agree to the public offer")
                    .frame(width: 258, height: 50)
                    .multilineTextAlignment(.center)
                    .padding()
                
                NavigationLink(destination: ChooseView(width: width, height: height)){
                    
                    ButtonView(text: "Sign Up", width: width, height: height, disabled: false)
                        .padding(.bottom, 100)
                }
             
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.top)
        .toolbar {
            NavBar()
        }
    }
}

struct SignupView_Preview: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            SignupView(width: 414, height: 818)
        }
    }
}
