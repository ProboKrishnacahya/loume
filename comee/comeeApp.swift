//
//  comeeApp.swift
//  comee
//
//  Created by Probo Krishnacahya on 19/06/23.
//

import SwiftUI

@main
struct comeeApp: App {
    @StateObject private var userData = User(name: "", goals: [])

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(userData)
        }
    }
}
