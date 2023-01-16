//
//  CoreDataDemoApp.swift
//  CoreDataDemo
//
//  Created by Andreas Wenzelhuemer on 12.01.23.
//

import SwiftUI

@main
struct CoreDataDemoApp: App {
    
    @StateObject private var storageProvider = StorageProvider()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(
                    \.managedObjectContext,
                    storageProvider.persistentContainer.viewContext
                )
        }
    }
}
