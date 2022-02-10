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

    var screenWidth: CGFloat
    var screenHeight: CGFloat
    
    var body: some View {
        ZStack {
            BackgroundTriangle()
            VStack(alignment: .center) {
                Spacer()
                
                LoginComponents(loginVM: loginVM, screenWidth: screenWidth, screenHeight: screenHeight) //.offset(y: 100)
                
                Spacer().frame(height: 64)
                
                if loginVM.showProgressView { ProgressView() }
    
                // Log In Button
                Button {
                    // Action
                    loginVM.login { success in
                        authentication.updatedValidation(success: success)
                    }
                } label: {
                    // View
                    ButtonView(disabled: loginVM.loginDisabled, width: screenWidth, height: screenHeight)
                }.padding()
                Spacer()
            }
            .frame(width: 828, height: 1917)
            .offset(y: 75)
            .padding()
        }
        .toolbar {
            NavBar()
        }
        .alert(item: $loginVM.error) {
            error in Alert(title: Text("Invalid Login"), message: Text(error.localizedDescription))
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
//            .bold()
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
