import CoreData

class StorageProvider: ObservableObject {
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "Model")
        
        persistentContainer.loadPersistentStores {
            description, error in
            if let error = error {
                fatalError("Core Data store failed to load with error: \(error)")
            }
        }
    }
}
