//
//  SettingsView.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 3/10/22.
//

import SwiftUI

struct DrawerView: View {
    var width, height: CGFloat
    @Binding var confirmLogout: Bool

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

                NavigationLink(destination: EditProfileView(width: width, height: height)) {
                    Text("Edit Profile")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .opacity(0.7)
                }
            }

            // Tab Buttons
            VStack(alignment: .leading) {
                // Account Types
                NavigationLink(destination: AccountType(width: width, height: height)) {
                    TabButton(dims: [width, height], img: "arrow.triangle.2.circlepath.circle",
                              title: "Switch Account Type")
                }
                // Payment Methods
                NavigationLink(destination: PaymentsView(width: width, height: height)) {
                    TabButton(dims: [width, height], img: "dollarsign.circle", title: "Payment Methods")
                }
                // Settings
                NavigationLink(destination: SettingsPage(width: width, height: height)) {
                    TabButton(dims: [width, height], img: "gearshape", title: "Settings")
                }
                // Documents
                NavigationLink(destination: DocumentsView(width: width, height: height)) {
                    TabButton(dims: [width, height], img: "doc", title: "Documents")
                }
                // Invite Friends
                NavigationLink(destination: InviteFriendsView(width: width, height: height)) {
                    TabButton(dims: [width, height], img: "person.crop.circle.badge.plus", title: "Invite Friends")
                }
                // Contact Support
                NavigationLink(destination: SupportView(width: width, height: height)) {
                    TabButton(dims: [width, height], img: "message", title: "Contact Support")
                }
            }
            Spacer()
            Button {
                withAnimation(.spring()) {
                    confirmLogout.toggle()
                }
            } label: {
                TabButton(dims: [width, height], img: "rectangle.portrait.and.arrow.right", title: "Sign Out")
                    .padding(.bottom)
            }
        }
        .padding(.horizontal, 50)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

//struct DrawerView_Preview: PreviewProvider {
//    static var previews: some View {
//        DrawerView()
//    }
//}
