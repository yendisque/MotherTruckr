//
//  SearchView.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 2/26/22.
//

import SwiftUI

struct SearchView: View {
    var width, height: CGFloat
    
    var body: some View {
        VStack {
            SearchBar(width: width, height: height)
            HStack {
                Text("Filters")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .padding(.leading, 35)
                Spacer()
            }
            Spacer()
        }.offset(y: -25)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    //authentication.updatedValidation(success: false)
                } label: {
                    Image("Vector")
                        .font(.system(size: 30))
                }
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Search")
                    .fontWeight(.bold)
                    .font(.system(size: 35))
            }
        }
    }
}

struct SearchBar: View {
    var width, height: CGFloat
    @State var searchText: String = ""
    
    var body: some View {
        ZStack {
            Color(hex: 0xEEEEEE)
                
            HStack {
                 Image(systemName: "magnifyingglass")
                 TextField("Search", text: $searchText)
                Spacer()
                Image(systemName: "mic.fill")
            }
            .padding()
            .foregroundColor(Color(hex: 0xADACAC))
        }
        .frame(width: round(width * 0.8357), height: round(height * 0.0589))
        .cornerRadius(10)
    }
}

struct SearchView_Preview: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            SearchView(width: geo.size.width, height: geo.size.height)
                .offset(x: 50, y: 50)
        }
    }
}
