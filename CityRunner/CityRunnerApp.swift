//
//  CityRunnerApp.swift
//  CityRunner
//
//  Created by Fateh Khan on 28/04/2021.
//

import SwiftUI
import Firebase

@main
struct CityRunnerApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
