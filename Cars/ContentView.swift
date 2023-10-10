//
//  ContentView.swift
//  Cars
//
//  Created by William Mooney on 10/9/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var authModel: AuthModel

    var body: some View {
        Group {
            if authModel.accessToken.isEmpty {
                UnauthenticatedView().environmentObject(authModel)
            } else {
                AuthenticatedView().environmentObject(authModel)
            }
        }
    }
}

#Preview {
    ContentView()
}
