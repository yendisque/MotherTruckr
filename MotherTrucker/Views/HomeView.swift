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
    var testData = [
        ListingModel(fromAddress: "8504 W Sethane Rd.",
                     destinationAddress: "3001 E Revington In.",
                     timeFrame: "4 days", Compensation: 30000),
        ListingModel(fromAddress: "3444 S Stuprod Rd.",
                     destinationAddress: "5021 E Locus In.",
                     timeFrame: "4 days", Compensation: 25560)
    ]
    
    var body: some View {
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
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    authentication.updatedValidation(success: false)
                } label: {
                    Image("Vector")
                        .font(.system(size: 30))
                }
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Home")
                    .fontWeight(.bold)
                    .font(.system(size: 35))
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            HomeView(viewRouter: ViewRouter(), width: geo.size.width, height: geo.size.height)
        }
    }
}