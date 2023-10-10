//
//  AppDelegate.swift
//  Cars
//
//  Created by William Mooney on 10/9/23.
//

import Foundation
import SwiftUI
import UIKit
import SmartcarAuth

class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    var window: UIWindow?
    var smartcarSdk: SmartcarAuth? = nil
    var authModel: AuthModel = AuthModel()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }

    func applicationDidFinishLaunching(_ application: UIApplication) {
        window?.rootViewController = UIHostingController(rootView:
           ContentView()
             .environmentObject(authModel)
        )
    }

    class func appDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
}
