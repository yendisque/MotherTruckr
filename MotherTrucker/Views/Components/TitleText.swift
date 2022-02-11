//
//  TitleText.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 2/11/22.
//

import SwiftUI

struct TitleText: View {
    var text:String
    
    var body: some View {
        Text(text)
            .fontWeight(.bold)
            .font(.largeTitle)
            .multilineTextAlignment(.leading)
            .frame(width: 200, height: 200)
            .dynamicTypeSize(.accessibility1)
            
    }
}
