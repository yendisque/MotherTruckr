//
//  DocumentsView.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 3/17/22.
//

import SwiftUI

struct DocumentsView: View {
    @Environment(\.presentationMode) var presentationMode
    var width, height: CGFloat
    
    var body: some View {
        ZStack {
            Color(hex: 0xE8E8E8)
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Taxes")
                        .fontWeight(.bold)
                        .font(.system(size: 15))

                    Widget(w: width) {
                        HStack(spacing: 20) {
                            ZStack {
                                Color(hex: 0xA4EDC2)
                                
                                Image(systemName: "calendar")
                                    .font(.system(size: 40))
                                    .padding()
                            }
                            .clipShape(Circle())
                            .frame(width: 50)
                            .padding(.horizontal)
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text("April 18")
                                    .fontWeight(.bold)
                                    .font(.system(size: 25))
                                Text("Last day to file taxes")
                                    .fontWeight(.medium)
                                    .font(.system(size: 15))
                            }
                            Spacer()
                        }
                    }
                    
                    Widget(w: width) {
                        TaxWidgetView(width: width)
                    }
                    
                    Text("Contract Recipts")
                        .fontWeight(.bold)
                        .font(.system(size: 15))
                    
                    Widget(w: width) {
                        HStack(spacing: 30) {
                            VStack(alignment: .leading, spacing: 20) {
                                Text("Date: ")
                                    .foregroundColor(Color(hex: 0xADACAC))
                                    .fontWeight(.semibold)
                                    .font(.system(size: 15))
                                ContractDateView(text: "01/22/2022")
                                ContractDateView(text: "02/26/2022")
                                ContractDateView(text: "06/12/2022")
                                ContractDateView(text: "09/29/2022")
                            }
                            Spacer()
                            VStack(alignment: .leading, spacing: 20) {
                                Text("Status: ")
                                    .foregroundColor(Color(hex: 0xADACAC))
                                    .fontWeight(.semibold)
                                    .font(.system(size: 15))
                                ContractRecipt()
                                ContractRecipt()
                                ContractRecipt()
                                ContractRecipt()
                            }
                        }
                    }
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarColor(backgroundColor: .white)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Documents")
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

struct ContractDateView: View {
    var text: String
    var body: some View {
        Text(text)
            .foregroundColor(Color.black)
            .fontWeight(.semibold)
            .font(.system(size: 15))
    }
}

struct ContractRecipt: View {
    var body: some View {
        HStack {
            Text("Fulfilled")
                .foregroundColor(Color.black)
                .fontWeight(.semibold)
                .font(.system(size: 15))
            Spacer()
            Text("Download")
                .foregroundColor(Color(hex: 0x2ED573))
                .fontWeight(.semibold)
                .font(.system(size: 15))
        }
    }
}

struct TaxWidgetView: View {
    var width: CGFloat
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("IRS Form")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                Spacer()
            }
            
            Text("You have none at this time")
                .font(.system(size: 15))
                .fontWeight(.semibold)
                .padding()
                .padding(.horizontal)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 2)
                        .frame(width: round(width * 0.8164))
                )
            
            Text("*These forms are issued for you and the IRS*")
                .font(.system(size: 12))
                .fontWeight(.semibold)
            
            HStack {
                Text("Your 2021 Tax Reports")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                Spacer()
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 2)
                
                VStack(spacing: 10) {
                    HStack {
                        Text("Generate Tax Report")
                            .font(.system(size: 12))
                            .fontWeight(.semibold)
                            .padding()
                            .background(Color(hex: 0xA4EDC2))
                            .cornerRadius(5)
                        Spacer()
                    }
                    
                    HStack {
                        Text("2021 - 1099-NEC")
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                        Text(" (PDF)")
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: 0xADACAC))
                        Spacer()
                        Text("Download")
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: 0x2ED573))
                    }
                    
                    HStack {
                        Text("2021 - 1099-NEC")
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                        Text(" (CSV)")
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: 0xADACAC))
                        Spacer()
                        Text("Download")
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: 0x2ED573))
                    }
                    Spacer()
                }.padding()
            }// End of ZStack
            Text("*These reports are not shared with the IRS*")
                .fontWeight(.semibold)
                .font(.system(size: 12))
        }// End of VStack
    }
}



struct DocumentsView_Preview: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            DocumentsView(width: geo.size.width, height: geo.size.height)
        }
    }
}
