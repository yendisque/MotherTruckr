//
//  RoutingView.swift
//  MotherTrucker
//
//  Created by Alek Simpson on 2/24/22.
//

import SwiftUI

struct RoutingView: View {
    @StateObject var viewRouter: ViewRouter
    var width, height: CGFloat
    
    var body: some View {
        NavigationView {
            ZStack {
                switch viewRouter.currentPage {
                    case .map:
                        TrackingView(width: width, height: height)
                    case .search:
                        SearchView(width: width, height: height)
                    case .home:
                        HomeView(viewRouter: viewRouter, width: width, height: height)
                    case .chainlink:
                        PaymentsView(width: width, height: height)
                    case .messages:
                        MessagesView(width: width, height: height)
                }
            }.toolbar {
                ToolbarItem(placement: .bottomBar) {
                    BottomBar(viewRouter: viewRouter, width: width, height: height)
                }
            }
        }
    }
}


class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .home
}

enum Page {
    case map
    case search
    case home
    case chainlink
    case messages
}
