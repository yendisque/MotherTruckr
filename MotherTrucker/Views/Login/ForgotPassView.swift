//
//  ForgotPassView.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 2/15/22.
//

import SwiftUI

// he forgor

struct ForgotPassView: View {
    var width, height: CGFloat
    @State var text:String = ""
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                TitleText(text: "Forgot Password ?")
                    .padding(.trailing, 120)
                    .padding(.bottom, 40)
                    .padding(.leading, 10)
                    .padding(.top, 60)
                ZStack {
                    CardBackground(width: width, height: height)
                    
                    VStack {
                        TextArea(image: "envelope.fill", placeholder: "Enter your email address",
                                 text: $text, width: width, height: height)
                            .padding(.top, 30)
                        
                        FPMessageView()
                        
                        ButtonView(text: "Send Code", width: width, height: height, disabled: false)
                            .padding()
                        Spacer()
                    }
                }
            }.ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            NavBar()
        }
    }
}

struct FPMessageView: View {
    var body: some View {
        Group {
            Text("*")
                .foregroundColor(.red)
            + Text(" We will send you a message to set or reset our new password")
        }
        .frame(width: 258, height: 50)
    }
}

struct CardBackground: View {
    var width, height: CGFloat
    var body: some View {
        Rectangle()
            .fill(
                LinearGradient(gradient:Gradient(colors: [Color(hex: 0x2ED573),
                                                          Color(hex: 0x7BED9F)]),
                                                          startPoint: .bottomTrailing, endPoint: .topLeading)
            )
            .cornerRadius(30)
            .frame(width: width, height: height * 0.9165)
    }
}

struct ForgotPassView_Preview: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            ForgotPassView(width: geo.size.width, height: geo.size.height)
        }
    }
}
