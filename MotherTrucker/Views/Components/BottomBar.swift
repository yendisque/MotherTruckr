//
//  BottomBar.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 2/24/22.
//

import SwiftUI

struct BottomBar: View {
    @StateObject var viewRouter: ViewRouter
    var width, height: CGFloat
    
    var body: some View {
        ZStack {
            Color(hex: 0xFFFFFF, opacity: 1.0)
                .frame(width: width, height: round(height * 0.0713) + 45)
                .offset(y: 25)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Divider().offset(y: -10)
                HStack(spacing: 50) {
                    TabBarIcon(viewRouter: viewRouter, iconName: "Map", systemName: "mappin", assignedPage: .map)
                    TabBarIcon(viewRouter: viewRouter, iconName: "Search", systemName: "magnifyingglass", assignedPage: .search)
                    TabBarIcon(viewRouter: viewRouter, iconName: "Home", systemName: "house", assignedPage: .home)
                    TabBarIcon(viewRouter: viewRouter, iconName: "Chainlink", systemName: "hexagon", assignedPage: .chainlink)
                    TabBarIcon(viewRouter: viewRouter, iconName: "Messages", systemName: "message", assignedPage: .messages)
                }
            }
        }
    }
}

struct TabBarIcon: View {
    @StateObject var viewRouter: ViewRouter
    var iconName, systemName: String
    let assignedPage: Page
    
    var body: some View {
        Image(systemName: systemName)
            .imageScale(.large)
            .foregroundColor((viewRouter.currentPage == assignedPage ? .green : .black))
            .onTapGesture {
                viewRouter.currentPage = assignedPage
            }
    }
}
