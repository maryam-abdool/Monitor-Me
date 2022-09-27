//
//  Monitor_MeApp.swift
//  Shared
//
//  Created by Maryam Abdool on 4/23/22.
//

import SwiftUI

@main
struct Monitor_MeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(motion: MotionManager())
        }
    }
}
