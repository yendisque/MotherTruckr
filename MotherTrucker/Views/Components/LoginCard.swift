//
//  LoginCard.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 2/9/22.
//

import SwiftUI

struct LoginCardView: View {
    var width, height: CGFloat
    
    var body: some View {
        ZStack {
            Color.white
            VStack(alignment: .center) {
                Text("Or sign in with")
                    .foregroundColor(Color.BackgroundBlack)
                    .bold()
                    .padding()
                
                HStack(spacing: 20) {
                    LogoView(icon: "googlelogo")
                    LogoView(icon: "applelogo")
                    LogoView(icon: "metalogo")
                }.padding(.bottom)
            }
        }
        .frame(width: round(width * 0.3671), height: round(height * 0.0678)) // 0.1361
        .cornerRadius(20)
        .shadow(radius: 4, y: 4)
    }
}

struct LogoView: View {
    var icon: String
    
    var body: some View {
        ZStack(alignment: .center) {
            Circle()
            if icon == "applelogo" {
                Image(systemName: icon)
                    .imageScale(.large)
                    .foregroundColor(.white)
            }else {
                Image(icon)
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            
        }
        .frame(width: 48, height: 48)
        .foregroundColor(.BackgroundBlack)
    }
}

struct LoginCardView_Preview: PreviewProvider {
    static var previews: some View {
        LoginCardView(width: 828, height: 1917)
    }
}
