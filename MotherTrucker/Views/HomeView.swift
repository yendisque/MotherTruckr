//
//  HomeView.swift
//  MotherTrucker
//
//  Created by Jason Coawette on 2/8/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authentication: Authentication
    var body: some View {
        VStack {
            HStack {
                Text("Home")
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Log out") {
                    authentication.updatedValidation(success: false)
                }
            }
        }
        .navigationTitle("Home")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
