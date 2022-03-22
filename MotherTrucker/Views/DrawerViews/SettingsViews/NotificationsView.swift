//
//  NotificationsView.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 3/18/22.
//

import SwiftUI

struct Notifications: View {
    @Environment(\.presentationMode) var presentationMode
    var width, height: CGFloat
    @State var pushNotifs: Bool = false
    @State var trackingNotifs: Bool = false
    @State var incidentNotifs: Bool = false
    
    var body: some View {
        ZStack {
            Color(hex: 0xE8E8E8)
                .ignoresSafeArea()
            
            VStack {
                Text("Choose the messages you would like to receive")
                    .font(.custom(Custom.Poppins.medium, size: 15))
                    .foregroundColor(Color(hex: 0x808080))
                
                Widget(w: width, h: round(height * 0.2297)) {
                    VStack(spacing: 20) {
                        HStack {
                            Text("Push Notifications")
                                .font(.custom(Custom.Poppins.medium, size: 15))
                            Spacer()
                            Toggle("", isOn: $pushNotifs)
                        }
                        HStack {
                            Text("Tracking Notifications")
                                .font(.custom(Custom.Poppins.medium, size: 15))
                            Spacer()
                            Toggle("", isOn: $trackingNotifs)
                        }
                        HStack {
                            Text("Incident Notifications")
                                .font(.custom(Custom.Poppins.medium, size: 15))
                            Spacer()
                            Toggle("", isOn: $incidentNotifs)
                        }
                    }
                }
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarColor(backgroundColor: .white)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Notifications")
                    .fontWeight(.bold)
                    .font(.system(size: 21))
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
