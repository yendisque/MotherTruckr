//
//  FirstLandingView.swift
//  MotherTrucker
//
//  Created by Jason Coawette on 2/9/22.
//

// To DO
// - FIX Color Transition Between rectanagle and triangle backrounds

import SwiftUI

struct LandingView: View
{
    var screenWidth, screenHeight: CGFloat
    
    var body: some View
    {
        ZStack
        {
            
            
            NavigationLink(destination: LoginView(screenWidth: screenWidth, screenHeight: screenHeight))
            {
                Text("Log In")
                .fontWeight(.semibold)
                .font(.title)
                .padding(.horizontal, 95.0)
                .padding(.vertical, 13)
                .frame(width: 300.0, height: 55)
                .accentColor(.black)
                .background(Color.white)
                .cornerRadius(30)
                .shadow(radius: 4, y: 4)
                .offset(y: 300)
                
            }
        
            
            HStack
            {
                
                Text("Already have an account?")
                    .frame(width: 200, height: 18)
                    .offset(x: 190, y: 240)
                
                Image("FirstLandingViewImage")
                    .resizable()
                    .frame(width: 380, height: 240)
                    .offset(x: -110)
            }
            .background(
                Triangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [ Color(hex: 0x7BED9F), Color(hex: 0x07C656) ]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 500, height: 250))
            
            
            Text("The Future of Supply")
                .fontWeight(.bold)
                .font(.largeTitle)
                .multilineTextAlignment(.leading)
                .frame(width: 200, height: 200)
                .offset(x: -65 ,y: -280)
                .dynamicTypeSize(.accessibility1)
            
            
        }
        .background(
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [ Color(hex: 0x7BED9F), Color(hex: 0x07C656) ]), startPoint: .topLeading, endPoint: .topTrailing))
                .frame(width: 500, height: 290)
                .offset(y: 270))
    }
}

struct LandingView_Previews: PreviewProvider
{
    static var previews: some View
    {
        LandingView(screenWidth: 828, screenHeight: 1917)
    }
}
