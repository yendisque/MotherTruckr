//
//  InviteFriendsView.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 3/17/22.
//

import SwiftUI

struct InviteFriendsView: View {
    @Environment(\.presentationMode) var presentationMode
    var width, height: CGFloat
    
    var body: some View {
        ZStack {
            Color(hex: 0xE8E8E8)
                .ignoresSafeArea()
            
            VStack {
                InvFriendsGraphic(width: width, height: height)
                
                HStack {
                    Text("Spread the Word")
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                    Spacer()
                }.padding(.horizontal)
                
                Widget(w: width) {
                    VStack(spacing: 20) {
                        HStack {
                            Image(systemName: "phone.circle")
                                .imageScale(.large)
                            Text("Invite Friends by WhatsApp")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            Spacer()
                        }.padding(.horizontal)
                        HStack {
                            Image(systemName: "ellipsis.bubble")
                                .imageScale(.large)
                            Text("Invite Friends by SMS")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            Spacer()
                        }.padding(.horizontal)
                        HStack {
                            Image(systemName: "square.and.arrow.up")
                                .imageScale(.large)
                            Text("Invite Friends by ...")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            Spacer()
                        }.padding(.horizontal)
                        
                        Text("Https: MotherTrucker/Share/Link/Bh6gsuo#fns")
                            .font(.custom(Custom.Roboto.regular, size: 12))
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                                    .frame(width: round(width * 0.6859))
                            )
                        
                        Text("Share Link")
                            .padding()
                            .frame(width: round(width * 0.6859), height: round(height * 0.0638))
                            .background(Color(hex: 0xA4EDC2))
                            .cornerRadius(10)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarColor(backgroundColor: .white)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Invite Friends")
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

struct InvFriendsGraphic: View {
    var width, height: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color(hex: 0x7BED9F))
                .frame(width: round(width * 0.8212), height: round(width * 0.8212))
            
            ZStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.black, lineWidth: 15)
                        .frame(width: 181, height: 169)
                        .background(
                            Color.white
                                .cornerRadius(30)
                        )
                    
                    HStack(spacing: 20) {
                        Circle()
                            .frame(width: 30, height: 30)
                        Circle()
                            .frame(width: 30, height: 30)
                        Circle()
                            .frame(width: 30, height: 30)
                    }
                }.offset(x: 70, y: -70)
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.black, lineWidth: 15)
                        .frame(width: round(width * 0.3429), height: round(height * 0.1658))
                        .background(
                            Color.white
                                .cornerRadius(30)
                        )
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Rectangle()
                            .frame(width: 80, height: 10)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                        Rectangle()
                            .frame(width: 80, height: 10)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                        Rectangle()
                            .frame(width: 55, height: 10)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }

                }.offset(x: -60, y: 20)
            }.offset(x: -10, y:30)
        }
    }
}
