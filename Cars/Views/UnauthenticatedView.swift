//
//  UnauthenticatedView.swift
//  Cars
//
//  Created by William Mooney on 10/9/23.
//

import SwiftUI
import SmartcarAuth
import Alamofire

struct UnauthenticatedView: View {
    @EnvironmentObject private var authModel: AuthModel

    var body: some View {
        VStack {
            Spacer()
            Button("Login to Smartcar") {
                authModel.launchAuthFlow()
            }.buttonStyle(CarsButtonStyle())
            Spacer()
        }
        .padding()
    }
}

#Preview {
    UnauthenticatedView()
}
