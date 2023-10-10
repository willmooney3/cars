//
//  Config.swift
//  Cars
//
//  Created by William Mooney on 10/9/23.
//

import Foundation

struct Config {
    static let SMARTCAR_CLIENT_ID: String = "YOUR_CLIENT_ID";
    static let SMARTCAR_REDIRECT_URL: String = "sc\(SMARTCAR_CLIENT_ID)://exchange";
    static let API_URL: String = "http://localhost:8000"
}
