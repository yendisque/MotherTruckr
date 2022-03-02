//
//  PaymentsView.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 2/26/22.
//

import SwiftUI

struct PaymentMethod: Hashable {
    var backgroundColor: Color
    var paymnetName: String
    var balance: Int
}

struct PaymentsView: View {
    var width, height: CGFloat
    var payments: [PaymentMethod] = [
        PaymentMethod(backgroundColor: Color(hex: 0x0941AE), paymnetName: "Chase Checking", balance: 120000),
        PaymentMethod(backgroundColor: Color(hex: 0x10B981), paymnetName: "MetaMask", balance: 57000),
        PaymentMethod(backgroundColor: Color(hex: 0x374151), paymnetName: "Crypto.com", balance: 34210)
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                AddPaymentMethod(width: width, height: height)
                
                ForEach(payments, id: \.self) { pmt in
                    VStack {
                        PaymentMethodView(width: width, height: height, backgroundColor: pmt.backgroundColor, paymentName: pmt.paymnetName, balance: pmt.balance)
                            .shadow(radius: 5)
                            .padding()
                    }
                }
                
                CreditCardView(width: width, height: height, balance: 2000000)
                    .shadow(radius: 5)
                    .padding(.top, 40)
            }
            .offset(y: -25)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //authentication.updatedValidation(success: false)
                    } label: {
                        Image(systemName: "list.bullet")
                            .padding(.leading, 5.0)
                            .padding(.bottom, 7.0)
                            .padding(.top, 2.0)
                            .imageScale(.large)
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Payments")
                        .fontWeight(.bold)
                        .font(.system(size: 35))
                }
            }
        }
    }
}

struct PaymentMethodView: View {
    var width, height: CGFloat
    var backgroundColor: Color
    var paymentName: String
    var balance: Int
    
    var body: some View {
        ZStack {
            backgroundColor.cornerRadius(20)
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Balance")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                    Text("$\(String(balance))")
                        .fontWeight(.bold)
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                }.padding()
                
                Spacer()
                
                Image(systemName: "creditcard.fill")
                    .imageScale(.medium)
                    .foregroundColor(.white)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Paymnet Name")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                    Text(paymentName)
                        .fontWeight(.bold)
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                }.padding()
            }
        }
        .frame(width: round(width * 0.8816), height: round(height * 0.0909))
    }
}

struct CreditCardView: View {
    var width, height: CGFloat
    var balance: Int
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [
                    Color(hex: 0xF59739),
                    Color(hex: 0xC69C30)
                ]), startPoint: .top, endPoint: .bottomLeading)
            
            VStack { //MARK: Main VStack
                HStack { //MARK: HSTACK 1
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Balance")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                        Text("$\(String(balance))")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                    }.padding()
                    Spacer()
                    CreditCardLogo(cardWidth: round(width * 0.8792)).padding()
                }
                
                HStack { // MARK: HSTACK 2
                    Text("**** **** **** 1234")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                    Spacer()
                }.padding(.leading)
                
                HStack { // MARK: HSTACK 3
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Card Name")
                        Text("Westmen LLC")
                    }.foregroundColor(.white)
                    Spacer()
                    VStack(alignment: .leading, spacing: 10) {
                        Text("EXP")
                        Text("10/24")
                    }.foregroundColor(.white)
                    Spacer()
                    VStack(alignment: .leading, spacing: 10) {
                        Text("CVV Number")
                        Text("321")
                    }.foregroundColor(.white)
                }.padding()
            }
        }
        .cornerRadius(20)
        .frame(width: round(width * 0.8792), height: round(height * 0.2457))
    }
    
    func processBalance(){}
}

struct CreditCardLogo: View {
    var cardWidth: CGFloat
    
    var body: some View {
        let ratio = 40 / cardWidth
        
        HStack {
            Circle()
                .foregroundColor(.white)
                .frame(width: round(cardWidth * ratio), height: round(cardWidth * ratio))
                .offset(x: 25)
            Circle()
                .foregroundColor(Color(hex: 0xFFFFFF, opacity: 0.5))
                .frame(width: round(cardWidth * ratio), height: round(cardWidth * ratio))
        }
    }
}

struct AddPaymentMethod: View {
    var width, height: CGFloat
    var style = StrokeStyle(lineWidth: 2, dash: [3])
    
    var body: some View {
        Text("+ Add payment method")
            .frame(minWidth: 0, maxWidth: round(width * 0.8816))
            .foregroundColor(Color(hex: 0x4B5563))
            .font(.custom(Custom.PlusJakartaSans.regular, size: 14))
            .padding(.top, 25)
            .padding(.bottom, 25)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(hex: 0x9CA3AF), style: style)
            )
    }
}

struct PaymentsView_Preview: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            PaymentsView(width: geo.size.width, height: geo.size.height - 50)
        }
    }
}
