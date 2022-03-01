//
//  ChooseView.swift
//  MotherTrucker
//
//  Created by Jason Coawette on 2/24/22.
//

import SwiftUI

struct ChooseView: View{
    var width, height: CGFloat
    
    var body: some View{
       
        VStack {
            
            TitleText(text: "Who Are You ?")
                .padding(.top, 20)
                .padding(.bottom, 105)
                .padding(.trailing, 150)
                .frame(width: 350, height: 230)
                
                
            Image("chooseImage")
                .resizable()
                .frame(width: 350, height: 260, alignment: .center)
                .padding(.top, -80)
            
            
            Text("Dont Worry You Can Change This Later")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.BackgroundBlack)
                .frame(width: 300, height: 50, alignment: .center)
                .padding(35.0)
                
            HStack{
                    
                NavigationLink(destination: OnboardingView(width: width, height: height)){
                        
                    ChooseButtonView(text: "Trucker", width: width, height: height)
                        
                            
                }
                .padding()
                    
                    
                    
                    
                NavigationLink(destination: SupplierOnboardingView(width: width, height: height)){
                        
                    ChooseButtonView(text: "Supplier", width: width, height: height)
                            
                            
                }
                .padding()
            }
            .frame(width: 392.5, alignment: .center)
            .padding(.top)
            .padding(.leading, 12)
            .padding(.trailing)
            
            
        }
        .padding(.bottom, 260)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            NavBar()
        }
    }
}

struct ChooseButtonView: View{
    var text:String
    var width:CGFloat
    var height:CGFloat
    var body: some View{
        VStack(alignment: .center) {
            Text(text)
                .fontWeight(.semibold)
                .font(.title2)
                .frame(width: round(150), height: round(50))
                .accentColor(.black)
                .background(Color(hex: 0xA4EDC2))
                .cornerRadius(10)
                .shadow(radius: 4, y: 4)
        }
    }
}


struct ChooseView_Preview: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            ChooseView(width: 414, height: 818)
        }
    }
}
