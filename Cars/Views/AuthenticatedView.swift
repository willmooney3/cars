//
//  AuthenticatedView.swift
//  Cars
//
//  Created by William Mooney on 10/9/23.
//

import SwiftUI

struct AuthenticatedView: View {
    @EnvironmentObject private var authModel: AuthModel

    var body: some View {
        TabView {
            VehicleListView()
                .environmentObject(authModel)
                .tabItem({
                    Image(systemName: "car.fill")
                    Text("Vehicles")
                })
                .tag(0)
            SettingsView()
                .environmentObject(authModel)
                .tabItem({
                    Image(systemName: "gear")
                    Text("Settings")
                })
                .tag(1)
        }
    }
}

#Preview {
    AuthenticatedView()
}
