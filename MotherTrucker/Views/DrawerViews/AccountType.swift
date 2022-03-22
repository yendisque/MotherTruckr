//
//  AccountType.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 3/15/22.
//

import SwiftUI

enum AccountTypes {
    case trucker
    case supplier
}

struct AccountType: View {
    @Environment(\.presentationMode) var presentationMode
    var width, height: CGFloat
    // This will be set to the user account default, needs backend
    @State var selection: AccountTypes = .trucker
    
    var body: some View {
        ZStack {
            Color(hex: 0xE8E8E8)
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("Select Account Type")
                    .font(.custom(Custom.Poppins.medium, size: 15))
                    .foregroundColor(Color(hex: 0x808080))
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 5) {
                    SelectButton(height: height, text: "Supplier", type: .supplier, selection: $selection)
                    SelectButton(height: height, text: "Trucker", type: .trucker, selection: $selection)
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarColor(backgroundColor: .white)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Account Type")
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

struct SelectButton: View {
    var height: CGFloat
    var text: String
    var type: AccountTypes
    @Binding var selection: AccountTypes
    
    var body: some View {
        Button {
            selection = type
        } label: {
            ZStack {
                Color.white
                HStack {
                    Text(text)
                        .font(.custom(Custom.Poppins.medium, size: 15))
                        .padding(10)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    if selection == type {
                        Image(systemName: "checkmark")
                            .foregroundColor(Color(hex: 0x59E38C))
                            .padding(.horizontal)
                    }
                }
            }
            .cornerRadius(10)
            .padding()
            .frame(height: round(height * 0.06))
        }.buttonStyle(.plain)
    }
}

struct AccountType_Preview: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            AccountType(width: geo.size.width, height: geo.size.height)
        }
    }
}
