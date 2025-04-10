//
//  GaiaApp.swift
//  Gaia
//
//  Created by Amy Liang on 10/19/22.
//

import SwiftUI
import FirebaseCore

//Links database to app
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct GaiaApp: App {
    
    @StateObject private var vm = AppViewModel()
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(vm)
                .task {
                    await vm.requestDataScannerAccessStatus()  // first time user launch app and asks for datascanner access
                }
        }
    }
}
