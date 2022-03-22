//
//  EditProfileView.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 3/17/22.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    var width, height: CGFloat
    @State var devSettings: Bool = false
    @State var darkmode: Bool = false
    
    var body: some View {
        ZStack {
            Color(hex: 0xE8E8E8)
                .ignoresSafeArea()
            VStack(spacing: 15) {
                Widget(w: width) {
                    VStack(spacing: 25) {
                        HStack {
                            Text("Email:")
                                .font(.custom(Custom.Poppins.medium, size: 15))
                            Spacer()
                        }
                        HStack {
                            Text("First Name:")
                                .font(.custom(Custom.Poppins.medium, size: 15))
                            Spacer()
                        }
                        HStack {
                            Text("Last Name:")
                                .font(.custom(Custom.Poppins.medium, size: 15))
                            Spacer()
                        }
                        HStack {
                            Text("Reset Password:")
                                .font(.custom(Custom.Poppins.medium, size: 15))
                            Spacer()
                        }
                    }
                }
                
                HStack {
                    Text("Address")
                        .fontWeight(.bold)
                        .font(.system(size: 15))
                        .padding(.horizontal)
                    Spacer()
                }
                
                Widget(w: width) {
                    VStack(spacing: 25) {
                        HStack {
                            Text("Street Address:")
                                .font(.custom(Custom.Poppins.medium, size: 15))
                            Spacer()
                        }
                        HStack {
                            Text("Apt #:")
                                .font(.custom(Custom.Poppins.medium, size: 15))
                            Spacer()
                        }
                        HStack {
                            Text("City:")
                                .font(.custom(Custom.Poppins.medium, size: 15))
                            Spacer()
                        }
                        HStack {
                            Text("State:")
                                .font(.custom(Custom.Poppins.medium, size: 15))
                            Spacer()
                        }
                        HStack {
                            Text("Zip Code:")
                                .font(.custom(Custom.Poppins.medium, size: 15))
                            Spacer()
                        }
                        HStack {
                            Text("Country:")
                                .font(.custom(Custom.Poppins.medium, size: 15))
                            Spacer()
                        }
                    }
                }
                
                HStack {
                    Text("Display")
                        .fontWeight(.bold)
                        .font(.system(size: 15))
                        .padding(.horizontal)
                    Spacer()
                }
                
                Widget(w: width) {
                    VStack(spacing: 25) {
                        ProfileRow(width: width, height: height, iconName: "text.aligncenter",
                                   text: "Device Settings", color: Color(hex: 0x7BED9F), toggle: $devSettings)
                        ProfileRow(width: width, height: height, iconName: "moon.fill",
                                   text: "Dark Mode", color: Color.black, toggle: $darkmode)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarColor(backgroundColor: .white)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Jason Coawette")
                    .fontWeight(.bold)
                    .font(.system(size: 35))
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { presentationMode.wrappedValue.dismiss() }) {
                    ZStack {
                        Capsule()
                            .fill(.black)
                            .frame(width: 30, height: 2)
                            .rotationEffect(.init(degrees: -45))
                        Capsule()
                            .fill(.black)
                            .frame(width: 30, height: 2)
                            .rotationEffect(.init(degrees: 45))
                    }
                }
            }
        }
    }
}


struct ProfileRow: View {
    var width, height: CGFloat
    var iconName, text: String
    var color: Color
    @Binding var toggle: Bool
    
    var body: some View {
        HStack {
            ZStack {
                color
                Image(systemName: iconName)
                    .foregroundColor(.white)
            }
            .frame(width: 38, height: 38)
            .cornerRadius(7)
            
            Text(text)
                .lineLimit(nil)
                .font(.custom(Custom.Poppins.medium, size: 15))
            Spacer()
            Toggle("",isOn: $toggle)
        }
    }
}
