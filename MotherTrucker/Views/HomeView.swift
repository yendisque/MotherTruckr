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
    var testData = [
        ListingModel(fromAddress: "8504 W Sethane Rd.",
                     destinationAddress: "3001 E Revington In.",
                     timeFrame: "4 days", Compensation: 30000),
        ListingModel(fromAddress: "3444 S Stuprod Rd.",
                     destinationAddress: "5021 E Locus In.",
                     timeFrame: "4 days", Compensation: 25560)
    ]
    
    var body: some View {
        ZStack {
            MenuView()
                .opacity(showSideMenu ? 1 : 0)
            
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
                    
                    ScrollView {
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
                }
                .background(
                    Color.white
                        .frame(width: width, height: height + 50)
                        .cornerRadius(20)
                        .ignoresSafeArea()
                )
                .onTapGesture {
                    if showSideMenu {
                        withAnimation(.spring()) {
                            showSideMenu.toggle()
                        }
                    }
                }
                .offset(x: showSideMenu ? width - 120 : 0)
                .frame(width: showSideMenu ? width + 50 : width)
                .scaleEffect(showSideMenu ? 0.84 : 1)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
    //                        authentication.updatedValidation(success: false)
                            withAnimation(.spring()) {
                                showSideMenu.toggle()
                            }
                        },label: {
                            VStack(spacing: 5) {
                                Capsule()
                                    .fill(.black)
                                    .frame(width: 30, height: 3)
                                    .rotationEffect(.init(degrees: showSideMenu ? -45 : 0))
                                    .offset(x: showSideMenu ? 2 : 0, y: showSideMenu ? 9 : 0)
                                
                                VStack(spacing: 5) {
                                    Capsule()
                                        .fill(.black)
                                        .frame(width: 30, height: 3)
                                    
                                    Capsule()
                                        .fill(.black)
                                        .frame(width: 30, height: 3)
                                        .offset(y: showSideMenu ? -8 : 0)
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
                }
                Spacer()
            }
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        GeometryReader { geo in
//            HomeView(viewRouter: ViewRouter(), width: geo.size.width, height: geo.size.height, showSideMenu: false)
//        }
//    }
//}
