//
//  StudentsApp.swift
//  Students
//
//  Created by Andreas Wenzelhuemer on 13.01.23.
//

import SwiftUI

@main
struct StudentsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
