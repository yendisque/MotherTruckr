//
//  SupplierOnboardingView.swift
//  MotherTrucker
//
//  Created by Jason Coawette on 2/24/22.
//

import SwiftUI

struct SupplierOnboardingView: View{
    var width, height: CGFloat
    
    var body: some View{
        
        ZStack{
            
            Image("ContractOBS")
                .resizable()
                .frame(width: 320, height: 320)
                .position(x: 207, y: 200)
            
            Text("Write Smart Contracts")
                .font(.title)
                .fontWeight(.bold)
                .frame(width: 200)
                .position(x: 120, y: 412)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent efficitur, tortor sed maximus consectetur, tellus ante consequat")
                .frame(width: 300, alignment: .leading)
                .position(x: 195, y: 512)
            
            VStack{
                NavigationLink(destination: SupplierOnboardingSupplyView(width: width, height: height)){
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
        .navigationBarBackButtonHidden(true)
        .toolbar {
            NavBar()
        }
    }
}



struct SupplierOnboardingSupplyView: View{
    var width, height: CGFloat
    
    var body: some View{
       
        ZStack{
            
            Image("BoxOBS")
                .resizable()
                .frame(width: 320, height: 320)
                .position(x: 207, y: 200)
            
            Text("Meet Demand and Beat The Shortages")
                .font(.title)
                .fontWeight(.bold)
                .frame(width: 280)
                .position(x: 165, y: 412)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent efficitur, tortor sed maximus consectetur, tellus ante consequat")
                .frame(width: 300, alignment: .leading)
                .position(x: 195, y: 512)
            
            VStack{
                NavigationLink(destination: SupplierOnboardingPayView(onboarding: false, width: width, height: height)){
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
        .navigationBarBackButtonHidden(true)
        .toolbar {
            NavBar()
        }
    }
}



struct SupplierOnboardingPayView: View{
    @State var onboarding: Bool
    var width, height: CGFloat
    
    var body: some View{
        
        
        ZStack{
            
            Image("PaidOBS")
                .resizable()
                .frame(width: 320, height: 320)
                .position(x: 207, y: 200)
            
            Text("Save On Logistics")
                .font(.title)
                .fontWeight(.bold)
                .frame(width: 200)
                .position(x: 98, y: 412)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent efficitur, tortor sed maximus consectetur, tellus ante consequat")
                .frame(width: 300, alignment: .leading)
                .position(x: 195, y: 512)
            
            VStack{
                Button(action: {
                    
                    onboarding = false
                    
                }) {
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
        .navigationBarBackButtonHidden(true)
        .toolbar {
            NavBar()
        }
    }
}


struct SupplierOnboardingPayView_Previews: PreviewProvider {
    static var previews: some View {
        
        GeometryReader { geo in
            SupplierOnboardingPayView(onboarding: false, width: 414, height: 818)
        }
    }
}
