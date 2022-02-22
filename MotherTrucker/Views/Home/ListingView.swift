//
//  JobCard.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 2/15/22.
//

import SwiftUI

struct ListingView: View {
    var width, height: CGFloat
    var startAddress, endAddress, timeFrame: String
    var Compensation: Int
    
    var body: some View {
        let w = round(width * 0.8841)
        let wRatio = 201 / w
        let w1 = round(w * wRatio)
        
        let h = round(height * 0.8841)
        let hRatio = 68 / h
        let h1 = round(h * hRatio)
        
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(startAddress)
                        .font(.system(size: 20))
                    Text(endAddress)
                        .font(.system(size: 20))
                }
                .frame(width: w1, height: h1, alignment: .leading)
                .padding(.top)
                .padding(.leading)
                
                VStack(alignment: .leading, spacing: 7) {
                    Text("Time frame: " + timeFrame)
                        .font(.system(size: 12))
                    Button { /* Details button */ } label: {
                        Text("View more details")
                            .font(.system(size: 12))
                    }
                }
                .padding(.top)
                .padding(.trailing)
            }
            Text("$" + String(Compensation.delimiter))
                .fontWeight(.semibold)
                .font(.system(size: 30))
                .padding(.trailing, 200)

            HStack(spacing: 40) {
                ListingButton(text: "Accept", width: width, height: height)
                ListingButton(text: "Message", width: width, height: height, isDark: true)
            }
            .padding(.bottom, 30)
        }
        .frame(width: round(width * 0.8841), height: round(height * 0.2383))
        .background(
            LinearGradient(gradient:Gradient(colors: [Color(hex: 0x2ED573),
                                                      Color(hex: 0x7BED9F)]),
                                             startPoint: .bottomTrailing, endPoint: .topLeading))
        .cornerRadius(30)
    }
}

struct ListingButton: View {
    var text: String
    var width, height: CGFloat
    var isDark: Bool = false
    
    var body: some View {
        Button {
            // Does something
        } label: {
            Text(text)
                .fontWeight(.semibold)
                .font(.system(size: 20))
                .frame(width: round(width * 0.3382), height: round(height * 0.0577))
                .foregroundColor(isDark ? .white : .black)
                .background(isDark ? Color.BackgroundBlack : .white)
                .cornerRadius(10)
        }
        .buttonStyle(.plain)
        .shadow(radius: 4)
    }
}

struct ListingView_Preview: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            ListingView(width: geo.size.width, height: geo.size.height,
                        startAddress: "8504 W Sethane Rd.",
                        endAddress: "3001 E Revington In.",
                        timeFrame: "4 days", Compensation: 30000)
                .offset(x: 30, y: 407)
        }
    }
}

struct ListingModel: Hashable {
    var fromAddress:String
    var destinationAddress:String
    var timeFrame: String
    var Compensation: Int
}

extension Int {
    private static var numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal

        return numberFormatter
    }()

    var delimiter: String {
        return Int.numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
