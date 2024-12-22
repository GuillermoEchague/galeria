//
//  CoreDataManager.swift
//  galeria
//
//  Created by Guillermo Echague on 22-12-24.
//


import CoreData

class CoreDataManager {
    static let shared = CoreDataManager() // Singleton

    // Contenedor persistente
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "galeria")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                print("Error al cargar Core Data: \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    // Contexto principal
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    // Contexto de fondo
    lazy var backgroundContext: NSManagedObjectContext = {
        let context = persistentContainer.newBackgroundContext()
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return context
    }()

    // Contenedor para vistas de preview
    static var preview: CoreDataManager = {
        let manager = CoreDataManager(inMemory: true)
        return manager
    }()

    // Inicializador
    private init(inMemory: Bool = false) {
        persistentContainer = NSPersistentContainer(name: "galeria")

        if inMemory {
            persistentContainer.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        persistentContainer.loadPersistentStores { _, error in
            if let error = error as NSError? {
                print("Error al cargar Core Data: \(error), \(error.userInfo)")
            }
        }
    }

    // Función para guardar cambios
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("Cambios guardados correctamente en Core Data.")
            } catch {
                let nserror = error as NSError
                print("Error al guardar en Core Data: \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
