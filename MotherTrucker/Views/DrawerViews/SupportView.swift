//
//  SupportView.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 3/17/22.
//

import SwiftUI

struct SupportView: View {
    @Environment(\.presentationMode) var presentationMode
    var width, height: CGFloat
    
    var body: some View {
        ZStack {
            Color(hex: 0xE8E8E8)
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                HStack {
                    Text("Common Issues")
                        .fontWeight(.bold)
                        .font(.system(size: 15))
                        .padding(.horizontal)
                    Spacer()
                }
                
                Widget(w: width) {
                    VStack(spacing: 30) {
                        SupportRow(width: width, height: height, text: "Add Payment Method")
                        SupportRow(width: width, height: height, text: "Tracking Transactions")
                    }
                }
                
                HStack {
                    Text("Account Management")
                        .fontWeight(.bold)
                        .font(.system(size: 15))
                        .padding(.horizontal)
                    Spacer()
                }
                
                Widget(w: width) {
                    VStack(spacing: 20) {
                        SupportRow(width: width, height: height, text: "View Transaction History")
                        SupportRow(width: width, height: height, text: "Taxes and Reports")
                        SupportRow(width: width, height: height, text: "Update my Country")
                    }
                }
                
                HStack {
                    Text("Contract Fullfilment")
                        .fontWeight(.bold)
                        .font(.system(size: 15))
                        .padding(.horizontal)
                    Spacer()
                }
                
                Widget(w: width) {
                    VStack(spacing: 20) {
                        SupportRow(width: width, height: height, text: "How long does it take to fulfill orders?")
                        SupportRow(width: width, height: height, text: "How do I track my shipments?")
                        SupportRow(width: width, height: height, text: "How do I become a trucker?")
                        SupportRow(width: width, height: height, text: "What do I need to become a trucker?")
                        SupportRow(width: width, height: height, text: "How do I accept contracts?")
                    }
                }
                
                HStack {
                    Spacer()
                    Text("Need more help?")
                    Spacer()
                }.padding(.horizontal)
                
                Button {
                    //
                } label: {
                    Text("Go to Help Center")
                        .frame(width: round(width * 0.6812), height: round(height * 0.0638))
                        .background(Color(hex: 0xA4EDC2))
                        .cornerRadius(10)
                }.padding(.horizontal)
                .buttonStyle(.plain)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarColor(backgroundColor: .white)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Help and Feedback")
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

struct SupportRow: View {
    var width, height: CGFloat
    var text: String
    
    var body: some View {
        Button {
            //
        } label: {
            HStack {
                Text(text)
                    .font(.custom(Custom.Poppins.medium, size: 15))
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(Color(hex: 0xD6D6D6))
            }
        }.buttonStyle(.plain)
    }
}
