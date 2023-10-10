//
//  AuthModel.swift
//  Cars
//
//  Created by William Mooney on 10/9/23.
//

import Foundation
import SwiftUI
import Alamofire
import SmartcarAuth

class AuthModel : ObservableObject {
    @Published var accessToken: String = ""
    @Published var smartcarSdk: SmartcarAuth? = nil

    func launchAuthFlow() {
        self.smartcarSdk = SmartcarAuth.init(
            clientId: Config.SMARTCAR_CLIENT_ID,
            redirectUri: Config.SMARTCAR_REDIRECT_URL,
            scope: ["read_vin", "read_vehicle_info", "read_location", "read_odometer"],
            completionHandler: completionHandler,
            testMode: true
        )
        let authUrl = self.smartcarSdk?.authUrlBuilder().build()
        if (authUrl != nil) {
            self.smartcarSdk?.launchAuthFlow(url: authUrl!)
        }
    }

    func completionHandler(code: String?, state: String?, err: AuthorizationError?) -> Void {
        if (code != nil) {
            self.signIn(code: code!)
        }
    }

    func signIn(code: String) {
        AF.request("\(Config.API_URL)/exchange?code=\(code)").responseDecodable(of: AuthResponse.self) { response in
            switch response.result {
            case .success(let value):
                self.accessToken = value.accessToken
            case .failure(let error):
               print(error)
            }
        }
    }

    func signOut() {
        self.accessToken = ""
        self.smartcarSdk = nil
    }
}
