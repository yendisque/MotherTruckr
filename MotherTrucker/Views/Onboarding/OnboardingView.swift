//
//  OnboardingView.swift
//  MotherTrucker
//
//  Created by Jason Coawette on 2/16/22.
//

import SwiftUI

struct OnboardingView: View {
    var width, height: CGFloat
    
    var body: some View {
        ZStack {
            Image("ContractOBS")
                .resizable()
                .frame(width: 320, height: 320)
                .position(x: 207, y: 200)
            
            Text("Apply For Smart Contracts")
                .font(.title)
                .fontWeight(.bold)
                .frame(width: 300)
                .position(x: 135, y: 412)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent efficitur, tortor sed maximus consectetur, tellus ante consequat")
                .frame(width: 300, alignment: .leading)
                .position(x: 195, y: 512)
            
            VStack {
                NavigationLink(destination: OnboardingSupplyView(width: width, height: height)){
                    Text("Next")
                        .font(.title2)
                        .fontWeight(.medium)
                        .padding(.horizontal, 40.0)
                        .padding(.vertical, 10.0)
                        .background(Color(hex: 0xA4EDC2))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
                .frame(width: 158, height: 52)
                .position(x: 300, y: 680)
            }
        }
    }
}

struct OnboardingSupplyView: View {
    var width, height: CGFloat
    
    var body: some View {
        ZStack {
            Image("BoxOBS")
                .resizable()
                .frame(width: 320, height: 320)
                .position(x: 207, y: 200)
            
            Text("Pick Up and Drop Off Supplies")
                .font(.title)
                .fontWeight(.bold)
                .frame(width: 300)
                .position(x: 135, y: 412)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent efficitur, tortor sed maximus consectetur, tellus ante consequat")
                .frame(width: 300, alignment: .leading)
                .position(x: 195, y: 512)
            
            VStack {
                NavigationLink(destination: OnboardingPayView(width: width, height: height)){
                    Text("Next")
                        .font(.title2)
                        .fontWeight(.medium)
                        .padding(.horizontal, 40.0)
                        .padding(.vertical, 10.0)
                        .background(Color(hex: 0xA4EDC2))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
            }
            .frame(width: 158, height: 52)
            .position(x: 300, y: 680)
        }
    }
}

struct OnboardingPayView: View {
    var width, height: CGFloat
    
    var body: some View {
        ZStack {
            Image("PaidOBS")
                .resizable()
                .frame(width: 320, height: 320)
                .position(x: 207, y: 200)
            
            Text("Get Paid those Fat Stacks")
                .font(.title)
                .fontWeight(.bold)
                .frame(width: 300)
                .position(x: 135, y: 412)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent efficitur, tortor sed maximus consectetur, tellus ante consequat")
                .frame(width: 300, alignment: .leading)
                .position(x: 195, y: 512)
            
            VStack {
                NavigationLink(destination: HomeView(viewRouter: ViewRouter(), width: width, height: height)) {
                    Text("Truck Me!")
                        .font(.title2)
                        .fontWeight(.medium)
                        .padding(.horizontal, 30.0)
                        .padding(.vertical, 10.0)
                        .background(Color(hex: 0xA4EDC2))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
            }
            .frame(width: 158, height: 52)
            .position(x: 300, y: 680)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            OnboardingPayView(width: 414, height: 818)
        }
    }
}
