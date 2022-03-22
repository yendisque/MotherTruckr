//
//  Templates.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 3/18/22.
//

import SwiftUI

struct Widget<Content: View>: View {
    var w: CGFloat
    var h: CGFloat? = nil
    @ViewBuilder var content: Content
    
    var body: some View {
        ZStack {
            Color.white
            
            content
                .padding()
        }
        .frame(width: round(w * 0.9347), height: h)
        .cornerRadius(19)
    }
}

struct ToggleRow: View {
    var width, height: CGFloat
    var iconName, text: String
    var color: Color
    @Binding var toggle: Bool
    
    var body: some View {
        HStack {
            Row(width: width, height: height, iconName: iconName, text: text, color: color, showChevron: false)
            Toggle("", isOn: $toggle)
                .padding(.horizontal)
                .padding(.horizontal)
        }
    }
}

struct LanguageRow: View {
    var width, height: CGFloat
    var text: String
    var rowLanguage: Languages
    @Binding var assignedLanguage: Languages
    
    var body: some View {
        HStack {
            Row(width: width, height: height, iconName: "", text: text, color: Color(hex: 0xFFFFFF), showChevron: false, showIcon: false)
            if rowLanguage == assignedLanguage {
                Image(systemName: "checkmark")
                    .imageScale(.large)
                    .foregroundColor(Color(hex: 0x59E38C))
            }
        }
    }
}

struct ButtonRow<Content: View>: View {
    var width, height: CGFloat
    var iconName, text: String
    var color: Color
    var action: () -> () = {}
    @ViewBuilder var trailing: Content
    
    var body: some View {
        Button {
            action()
        } label: {
            Row(width: width, height: height, iconName: iconName, text: text, color: color, showChevron: false)
            trailing
        }.buttonStyle(.plain)
    }
}

struct Row: View {
    var width, height: CGFloat
    var iconName, text: String
    var color: Color
    var showChevron: Bool = true
    var showLanguage: Bool = false
    var showIcon: Bool = true
    
    var body: some View {
        HStack {
            if showIcon {
                Icon(width: width, height: height,
                     name: iconName, color: color)
            }

            Text(text)
                .lineLimit(nil)
                .font(.custom(Custom.Poppins.medium, size: 15))
            Spacer()
            if showChevron {
                HStack {
                    if showLanguage {
                        Text("EN")
                            .foregroundColor(Color(hex: 0xD6D6D6))
                            .font(.system(size: 15))
                    }
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color(hex: 0xD6D6D6))
                        .padding(.horizontal)
                }
            }
        }.padding(.horizontal)
    }
}

struct Icon: View {
    var width, height: CGFloat
    var name: String
    var color: Color
    var body: some View {
        ZStack {
            color
            Image(systemName: name)
                .foregroundColor(.white)
        }
        .frame(width: 38, height: 38)
        .cornerRadius(7)
        .padding(.horizontal)
    }
}

struct Card<Content: View>: View {
    var width, height: CGFloat
    @Binding var showing: Bool
    var message: String
    var dismissText: String = "Cancel"
    @ViewBuilder var content: Content
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack(alignment: .center, spacing: 20) {
                Text(message)
                    .multilineTextAlignment(.center)
                    .font(.custom(Custom.Poppins.medium, size: 12))
                    .lineLimit(2)
                    .padding(.top)

                content
                
                Button {
                    withAnimation(.spring()){
                        showing = false
                    }
                } label: {
                    Text(dismissText)
                        .font(.custom(Custom.Poppins.semiBold, size: 15))
                }.buttonStyle(.plain)
                .padding(.bottom)
            }
        }
        .frame(width: round(width * 0.8454)) //9299
        .cornerRadius(15)
        .padding(.bottom)
        .shadow(radius: 10)
    }
}

struct NotificationCard: View {
    var width, height: CGFloat
    @Binding var showing: Bool
    var message: String
    var symbol: String = "checkmark.circle.fill" //exclamationmark.circle
    
    var body: some View {
        Card(width: width, height: height, showing: $showing, message: message, dismissText: "Close") {
            Image(systemName: symbol)
                .font(.system(size: 50))
                .foregroundColor(symbol == "checkmark.circle.fill" ? Color(hex: 0xA4EDC2) : Color.red)
        }
    }
}

struct YesButton: View {
    var w, h: CGFloat
    
    var body: some View {
        ZStack {
            Color(hex: 0xA4EDC2)
            Text("Yes")
                .font(.custom(Custom.Poppins.semiBold, size: 15))
        }
        .frame(width: round(w * 0.3719), height: round(h * 0.0442))
        .cornerRadius(10)
    }
}
