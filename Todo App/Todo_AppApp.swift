//
//  Todo_AppApp.swift
//  Todo App
//
//  Created by Luca Becker on 08.10.23.
//

import SwiftUI
import SwiftData

@main
struct Todo_AppApp: App {
    // Real app would use configurations and all that
    // TODO: Show error message for Error
    let container: ModelContainer = {
        do {
            let container = try ModelContainer(for: TodoItem.self)
            return container
        } catch {
            fatalError("Cannot create ModelContainer for TodoItems")
        }
    }()
    
    @AppStorage("isOnboarding") var isOnboarding = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding == true {
                StartingScreen()
            } else {
                NavigationStack {
                    MainScreen()
                }
                
            }
            
        }
        .modelContainer(container)
    }
}
