//
//  CustomTextArea.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 2/9/22.
//

import SwiftUI

struct TextArea: View {
    var image: String = "person.fill"
    var placeholder:String
    @Binding var text: String
    var width, height: CGFloat
    
    var body: some View {
        ZStack {
            Color.BackgroundBlack
            HStack(alignment: .center) {
                Image(systemName: image)
                    .imageScale(.medium)
                    .foregroundColor(.white)
                    .padding(.leading)
                
                TextField("", text: $text)
                    .placeholder(when: text.isEmpty) {
                        Text(placeholder)
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .offset(x: -15)
                            .padding()
                    }
                    .keyboardType(.emailAddress)
            }
        }
        .frame(width: width * 0.7557, height: height * 0.0676)
        .cornerRadius(10)
        .shadow(radius: 4, y: 4)
    }
}

struct SecureTextArea: View {
    var placeholder: String
    @Binding var text: String
    var width, height: CGFloat
    
    var body: some View {
        ZStack {
            Color.BackgroundBlack
            HStack(alignment: .center) {
                Image(systemName: "lock.fill")
                    .imageScale(.medium)
                    .foregroundColor(.white)
                    .padding(.leading)
                
                SecureField("", text: $text)
                    .placeholder(when: text.isEmpty) {
                        Text(placeholder)
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                            .offset(x: -15)
                            .padding()
                    }
                    .autocapitalization(.none)
            }
        }
        .frame(width: width * 0.7557, height: height * 0.0676)
        .cornerRadius(10)
        .shadow(radius: 4, y: 4)
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
