//
//  CarsApp.swift
//  Cars
//
//  Created by William Mooney on 10/9/23.
//

import SwiftUI

@main
struct CarsApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(appDelegate.authModel)
        }
    }
}
