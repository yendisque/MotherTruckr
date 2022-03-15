//
//  TabButton.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 3/10/22.
//

import SwiftUI

struct TabButton: View {
    var img: String
    var title: String
    var animation: Namespace.ID
     
    var body: some View {
        Button(action: {}) {
            HStack(spacing: 10) {
                Image(systemName: img)
                    .font(.title2)
                
                Text(title)
                    .fontWeight(.semibold)
            }
            .foregroundColor(.white)
            .padding(.vertical, 12)
        }
    }
}
