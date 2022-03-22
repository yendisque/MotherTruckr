//
//  HomeView.swift
//  MotherTrucker
//
//  Created by Jason Coawette on 2/8/22.
//
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authentication: Authentication
    @StateObject var viewRouter: ViewRouter
    var width, height: CGFloat
    @Binding var showSideMenu: Bool
    @State var confirmLogout: Bool = false
    
    var body: some View {
        ZStack {
            MenuView(width: width, height: height, confirmLogout: $confirmLogout)
                .opacity(showSideMenu ? 1 : 0)
            
            ZStack {
                Color.white
                    .cornerRadius(20)
                    .ignoresSafeArea()
                
                BodyView(width: width, height: height, showSideMenu: $showSideMenu)
            }
            .offset(x: showSideMenu ? width - 120 : 0,
                    y: showSideMenu ? 30 : 0)
            .scaleEffect(showSideMenu ? 0.94 : 1)
            
            ConfirmLogoutView(width: width, height: height, showing: $confirmLogout)
                .offset(y: confirmLogout ? height / 3 : height / 1.5)
        }.navigationBarColor(backgroundColor: Color(hex: 0xFFFFFF, opacity: 0))
    }
}

struct BodyView: View {
    var width, height: CGFloat
    @Binding var showSideMenu: Bool
    var testData = [
        ListingModel(fromAddress: "8504 W Sethane Rd.",
                     destinationAddress: "3001 E Revington In.",
                     timeFrame: "4 days", Compensation: 30000),
        ListingModel(fromAddress: "3444 S Stuprod Rd.",
                     destinationAddress: "5021 E Locus In.",
                     timeFrame: "4 days", Compensation: 25560)
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                BigCard(width: width, height: height)
                    .padding(.leading)
                    .padding(.trailing)

                Text("Smart Contracts")
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                    .padding()
                    .alignmentGuide(.leading) { d in d[.leading] + 8 }

                VStack(alignment: .center, spacing: 20) {
                    ForEach(testData, id: \.self) { listing in
                        ListingView(width: width, height: height,
                                    startAddress: listing.fromAddress,
                                    endAddress: listing.destinationAddress,
                                    timeFrame: listing.timeFrame, Compensation: listing.Compensation)
                            .padding(.leading)
                            .padding(.trailing)
                    }
                }
            }
            .padding()
            .onTapGesture {
                if showSideMenu {
                    withAnimation(.spring()) {
                        showSideMenu.toggle()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation(.spring()) {
                            showSideMenu.toggle()
                        }
                    },label: {
                        VStack(spacing: 5) {
                            Capsule()
                                .fill(.black)
                                .frame(width: 30, height: 2)
                                .rotationEffect(.init(degrees: showSideMenu ? -45 : 0))
                                .offset(x: showSideMenu ? 2 : 0, y: showSideMenu ? 8 : 0)

                            VStack(spacing: 5) {
                                Capsule()
                                    .fill(.black)
                                    .frame(width: 30, height: 2)

                                Capsule()
                                    .fill(.black)
                                    .frame(width: 30, height: 2)
                                    .offset(y: showSideMenu ? -7 : 0)
                                    
                            }
                            .rotationEffect(.init(degrees: showSideMenu ? 45 : 0))
                        }
                    })
                    .buttonStyle(.plain)
                }

                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Home")
                        .fontWeight(.bold)
                        .font(.system(size: 35))
                        .opacity(showSideMenu ? 0 : 1)
                }
            } // end of toolbar
        } // End of scroll view
    }
}

struct ConfirmLogoutView: View {
    var width, height: CGFloat
    @Binding var showing: Bool
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack(spacing: 20) {
                Text("Are you sure you want to log out?")
                    .fontWeight(.bold)
                    .font(.system(size: 15))
                
                HStack(spacing: 20) {
                    Button {
                        withAnimation(.spring()) {
                            showing = false
                        }
                    } label: {
                        Text("Back")
                            .padding()
                            .frame(width: round(width * 0.3937), height: round(height * 0.0638))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                    }.buttonStyle(.plain)
                    
                    Button {
                        //
                    } label: {
                        Text("Log Out")
                            .padding()
                            .frame(width: round(width * 0.3937), height: round(height * 0.0638))
                            .background(Color(hex: 0xA4EDC2))
                            .cornerRadius(10)
                    }.buttonStyle(.plain)
                }
            }
        }
        .frame(width: round(width * 0.9299), height: round(height * 0.1646))
        .cornerRadius(10)
        .padding(.bottom)
    }
}
