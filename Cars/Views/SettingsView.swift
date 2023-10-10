//
//  SettingsView.swift
//  Cars
//
//  Created by William Mooney on 10/9/23.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var authModel: AuthModel

    var body: some View {
        VStack {
            Spacer()
            Button("Sign Out") {
                authModel.signOut()
            }.buttonStyle(CarsButtonStyle(color: .red))
            Spacer()
        }
    }
}

#Preview {
    SettingsView()
}
