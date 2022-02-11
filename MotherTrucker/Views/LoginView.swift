//
//  LoginView.swift
//  MotherTrucker
//
//  Created by Jason Coawette on 2/7/22.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginVM = LoginViewModel()
    @EnvironmentObject var authentication: Authentication
    var screenWidth, screenHeight: CGFloat
    
    var body: some View {
        ZStack {
            BackgroundTriangle()
            VStack(alignment: .center) {
                TitleText(text: "Welcome Back")
                    .padding(.trailing, 150)
                    .offset(y: -50)
                
                // Text Fields
                LoginComponents(loginVM: loginVM, screenWidth: screenWidth, screenHeight: screenHeight)
                
                Spacer().frame(height: 64)
                
                // Log In Button
                LoginButton(loginVM: loginVM, width: screenWidth, height: screenHeight)
                    .padding(.bottom, 100)
            }
        }
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.top)
        .toolbar {
            NavBar()
        }
        .alert(item: $loginVM.error) {
            error in Alert(title: Text("Invalid Login"), message: Text(error.localizedDescription))
        }
    }
}

struct LoginButton: View {
    @StateObject var loginVM: LoginViewModel
    @EnvironmentObject var authentication: Authentication
    var width, height: CGFloat
    
    var body: some View {
        Button {
            loginVM.login { success in
                authentication.updatedValidation(success: success)
            }
        } label: {
            if loginVM.showProgressView {
                ProgressView()
            }else {
                ButtonView(text: "Log In", width: width, height: height, disabled: loginVM.loginDisabled)
            }
        }
    }
}

struct LoginComponents: View {
    @StateObject var loginVM: LoginViewModel
    var screenWidth, screenHeight: CGFloat
    
    var body: some View {
        TextArea(placeholder: "Username or Email",
                 text: $loginVM.credentials.email,
                 width: 317, height: 55)
            .padding(31)

        SecureTextArea(placeholder: "Password",
                       text: $loginVM.credentials.password,
                       width: 317, height: 55)
            .padding(.bottom)
        
        Text("Forgot Password?")
            .font(.system(size: 15))
            .padding()
        
        LoginCardView(width: screenWidth, height: screenHeight).padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(screenWidth: 828.0, screenHeight: 1719.0)
    }
}
