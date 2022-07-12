//
//  TodoApp.swift
//  Todo
//
//  Created by Sameera Perera on 2022-07-08.
//

import SwiftUI
import FirebaseCore

@main
struct TodoApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  var body: some Scene {
    WindowGroup {
      NavigationView {
        WelcomeView()
      }
    }
  }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
