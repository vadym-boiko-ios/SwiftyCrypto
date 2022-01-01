//
//  SwiftyCryptoApp.swift
//  SwiftyCrypto
//
//  Created by Vadym Boiko on 28.12.2021.
//

import SwiftUI

@main
struct SwiftyCryptoApp: App {
    @StateObject private var vm = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
