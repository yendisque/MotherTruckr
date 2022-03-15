//
//  SettingsView.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 3/10/22.
//

import SwiftUI

struct DrawerView: View {
    @Namespace var animation
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 70, height: 70)
                .padding(.top, 50)
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Username")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Button(action: {}) {
                    Text("Edit Profile")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .opacity(0.7)
                }
            }
            
            // Tab Buttons
            VStack(alignment: .leading, spacing: 0) {
                TabButton(img: "arrow.triangle.2.circlepath.circle",
                          title: "Switch Account Type", animation: animation)
                TabButton(img: "dollarsign.circle", title: "Payment Methods", animation: animation)
                TabButton(img: "gearshape", title: "Settings", animation: animation)
                TabButton(img: "doc", title: "Documents",animation: animation)
                TabButton(img: "person.crop.circle.badge.plus",
                          title: "Invite Friends", animation: animation)
                TabButton(img: "message", title: "Contact Support", animation: animation)
            }
        }
        .padding(.horizontal, 50)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct DrawerView_Preview: PreviewProvider {
    static var previews: some View {
        DrawerView()
    }
}
