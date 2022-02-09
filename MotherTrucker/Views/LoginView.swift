//
//  LoginView.swift
//  MotherTrucker
//
//  Created by Jason Coawette on 2/7/22.
//

import SwiftUI

struct LoginView: View
{
    @StateObject private var loginVM = LoginViewModel()
    @EnvironmentObject var authentication: Authentication
    var body: some View
    {
        ZStack {
            BackgroundTriangle()
            VStack {
//                Text("Welcome Back!")
//                    .fontWeight(.bold)
//                    .font(.largeTitle)
//                    .offset(x: -100, y: -280)
//                    .frame(width: 180, height: 150)
//
//                TextField("Email Address", text: $loginVM.credentials.email)
//                    .keyboardType(.emailAddress)
//                    .frame(width: 317, height: 55)
//                    .offset(x: 0, y: -150)
//
//                SecureField("Password", text: $loginVM.credentials.password)
//                    .frame(width: 317, height: 55)
//                    .offset(x: 0, y: -100)
    
                if loginVM.showProgressView
                {
                    ProgressView()
                }
    
                // Log In Button
                Button {
                    // Action
                    loginVM.login { success in
                        authentication.updatedValidation(success: success)
                    }
                } label: {
                    // View
                    ButtonView(disabled: loginVM.loginDisabled)
                }
            }
        }
        .autocapitalization(.none)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .disabled(loginVM.showProgressView)
        .alert(item: $loginVM.error)
        {
            error in Alert(title: Text("Invalid Login"), message: Text(error.localizedDescription))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
