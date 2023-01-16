//
//  StudentsApp.swift
//  Students
//
//  Created by Andreas Wenzelhuemer on 12.01.23.
//

import SwiftUI

@main
struct StudentsApp: App {
    
    @StateObject private var storageProvider = StorageProvider()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, storageProvider.persistentContainer.viewContext)
        }
    }
}
