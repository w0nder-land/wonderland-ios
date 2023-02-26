//
//  WonderLandApp.swift
//  WonderLand
//
//  Created by Jinho Choi on 2023/02/26.
//

import SwiftUI

@main
struct WonderLandApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
