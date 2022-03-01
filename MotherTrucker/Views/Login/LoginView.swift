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
            BackgroundTriangle(width: screenWidth, height: screenHeight)
                .offset(y: round(screenHeight * 0.092))
            VStack(alignment: .center) {
                TitleText(text: "Welcome Back !")
                    .padding(.top)
                    .padding(.trailing, 140)
                    .frame(width: 350, height: 125)
                    .padding(.bottom, 60)
                    
                
                Text("Enter Your Info")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.trailing, 160)
                    .padding(.bottom, 15)
                    
                // Text Fields
                LoginComponents(loginVM: loginVM, screenWidth: screenWidth, screenHeight: screenHeight)
                
                Spacer().frame(height: 64)
                
                // Log In Button
                LoginButton(loginVM: loginVM, width: screenWidth, height: screenHeight)
            }
        }
        .ignoresSafeArea()
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
        //MARK: I commented out this button code so that we can make it a navlink to the HomeView, this will be changed when we have the backend working
//        Button {
//            loginVM.login { success in
//                authentication.updatedValidation(success: success)
//            }
//        } label: {
        NavigationLink(destination: HomeView(width: width, height: height)) {
            if loginVM.showProgressView {
                ProgressView()
            }else {
                ButtonView(text: "Login", width: width, height: height, disabled: false)
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
                 width: screenWidth, height: screenHeight)
            .padding(.bottom, 20)

        SecureTextArea(placeholder: "Password",
                       text: $loginVM.credentials.password,
                       width: screenWidth, height: screenHeight)
            .padding(.bottom)
        
        NavigationLink(destination: ForgotPassView(width: screenWidth, height: screenHeight)) {
            Text("Forgot Password?")
                .font(.system(size: 15))
                .padding()
                
        }.buttonStyle(.plain)
            

        LoginCardView(width: screenWidth, height: screenHeight).padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            LoginView(screenWidth: geo.size.width, screenHeight: geo.size.height)
        }
    }
}
