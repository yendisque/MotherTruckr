//
//  ContentView.swift
//  MotherTrucker
//
//  Created by Jason Coawette on 2/3/22.
//

import SwiftUI

struct ContentView: View
{
    
    @State var animate = false
    @State var endSplash = false
    
    var body: some View
    {
        ZStack
        {
            Home()
            
            ZStack
            {
                Color("mg")
                
                Image("Truck")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width: animate ? nil : 45, height: animate ? nil : 45)
                
                // scaling the view
                .scaleEffect(animate ? 3 : 1)
                .frame(width: UIScreen.main.bounds.width)
                
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: animateSplash)
            .opacity(endSplash ? 0 : 1)
        }
    }
    
    func animateSplash()
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25)
        {
            withAnimation(Animation.easeOut(duration: 0.45))
            {
                animate.toggle()
            }
            withAnimation(Animation.linear(duration: 0.35))
            {
                endSplash.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}

//Home Screen

struct Home: View
{
    var body: some View
    {
        VStack
        {
            HStack
            {
                Text("Home")
                    
            }
            .navigationTitle("Home")
        }
    }
}
