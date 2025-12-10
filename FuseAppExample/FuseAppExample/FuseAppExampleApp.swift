//
// FuseAppExampleApp.swift
// FuseAppExample
//
// Copyright 2025 Publift Pty Ltd.
//

import FuseAppSDK
import SwiftUI

@main
struct FuseAppExampleApp: App {
    @UIApplicationDelegateAdaptor var appDelegate: FuseApplicationDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class FuseApplicationDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FuseSDK.shared.initializeSDK()
        return true
    }
}
