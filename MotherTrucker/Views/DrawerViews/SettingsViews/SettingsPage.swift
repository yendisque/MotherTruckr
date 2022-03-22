//
//  SettingsPage.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 3/16/22.
//

import SwiftUI

struct SettingsPage: View {
    @Environment(\.presentationMode) var presentationMode
    var width, height: CGFloat
    @State var sendUsageReports: Bool = false
    @State var showConfirmation: Bool = false
    
    var body: some View {
        ZStack {
            Color(hex: 0xE8E8E8)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    ZStack {
                        Color.white
                            .frame(width: round(width * 0.9347))
                            .cornerRadius(19)
                        VStack {
                            ButtonRow(width: width, height: height, iconName: "heart.fill",
                                      text: "Support Mother Trucker", color: Color(hex: 0xFF421B), action: {}) {
                                Image(systemName: "link")
                                    .foregroundColor(Color(hex: 0xD6D6D6))
                                    .padding(.horizontal)
                                    .padding(.horizontal)
                            }
                            
                            NavigationLink(destination: LanguageView(width: width, height: height)) {
                                Row(width: width, height: height, iconName: "globe",
                                    text: "Language", color: Color(hex: 0x0491F8), showLanguage: true)
                            }.buttonStyle(.plain)
                            
                            NavigationLink(destination: Notifications(width: width, height: height)) {
                                Row(width: width, height: height, iconName: "bell.badge",
                                    text: "Notifications", color: Color(hex: 0x2ED573))
                            }.buttonStyle(.plain)
                            
                            ButtonRow(width: width, height: height, iconName: "trash",
                                      text: "Clear Cache Data", color: Color(hex: 0xFFB800)) {
                                withAnimation(.spring()) {
                                    showConfirmation.toggle()
                                }
                            } trailing: {
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color(hex: 0xD6D6D6))
                                    .padding(.horizontal)
                                    .padding(.horizontal)
                            }
                            
                            Row(width: width, height: height, iconName: "lifepreserver",
                                text: "Feedback", color: Color(hex: 0xD93F21))
                        }.padding(.vertical)
                    }
                    
                    Text("Location Services")
                        .fontWeight(.bold)
                        .font(.system(size: 15))
                        .padding(.horizontal)
                    
                    ZStack {
                        Color.white
                            .frame(width: round(width * 0.9347))
                            .cornerRadius(19)
                        
                        VStack {
                            NavigationLink(destination: ReportView(width: width, height: height)) {
                                Row(width: width, height: height, iconName: "exclamationmark.shield", text: "Report", color: Color(hex: 0xFF8A00))
                            }.buttonStyle(.plain)
                            Row(width: width, height: height, iconName: "xmark.bin", text: "Blocked", color: Color(hex: 0xFF4B26))
                            Row(width: width, height: height, iconName: "globe.americas", text: "Country/Currency", color: Color(hex: 0xFF4B26))
                            Row(width: width, height: height, iconName: "phone", text: "Phone Numbers", color: Color(hex: 0x00FF54))
                        }.padding(.vertical)
                    }
                    
                    Text("Location Services")
                        .fontWeight(.bold)
                        .font(.system(size: 15))
                        .padding(.horizontal)
                    
                    ZStack {
                        Color.white
                            .frame(width: round(width * 0.9347))
                            .cornerRadius(19)
                        
                        VStack {
                            ButtonRow(width: width, height: height, iconName: "lock.shield",
                                      text: "Privacy Policy", color: Color(hex: 0x7000FF), action: {}) {
                                Image(systemName: "link")
                                    .foregroundColor(Color(hex: 0xD6D6D6))
                                    .padding(.horizontal)
                                    .padding(.horizontal)
                            }
                            ButtonRow(width: width, height: height, iconName: "text.aligncenter",
                                      text: "Terms of Service", color: Color(hex: 0x1C1C1E), action: {}) {
                                Image(systemName: "link")
                                    .foregroundColor(Color(hex: 0xD6D6D6))
                                    .padding(.horizontal)
                                    .padding(.horizontal)
                            }
                            ToggleRow(width: width, height: height, iconName: "hourglass",
                                      text: "Send Usage Reports", color: Color(hex: 0x2ED573), toggle: $sendUsageReports)
                        }.padding(.vertical)
                    }
                }
            }// End of scroll view
            Spacer()
            
            Card(width: width, height: height, showing: $showConfirmation, message: "Are you sure you want to clear your cache data?") {
                YesButton(w: width, h: height)
            }
            .frame(height: 50)
            .offset(y: showConfirmation ? height / 3 : height / 1.5)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarColor(backgroundColor: .white)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Settings")
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

struct SettingsPage_Preview: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            SettingsPage(width: geo.size.width, height: geo.size.height)
        }
    }
}
