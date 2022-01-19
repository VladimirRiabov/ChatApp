//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Владимир Рябов on 18.01.2022.
//

import SwiftUI
import Firebase

@main
struct ChatAppApp: App {
    
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate: AppDelegate
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}



//class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//
//        FirebaseApp.configure()
//
//        return true
//    }
//}

