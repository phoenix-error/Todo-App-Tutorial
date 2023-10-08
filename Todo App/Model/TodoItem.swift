//
//  TodoItem.swift
//  Todo App
//
//  Created by Luca Becker on 08.10.23.
//

import Foundation
import SwiftData

@Model
class TodoItem {
    @Attribute(.unique) var title: String
    var completed: Bool
    var priority: TodoPriority
    var plannedFor: Date
    
    init(title: String, completed: Bool = false, priority: TodoPriority, plannedFor: Date) {
        self.title = title
        self.completed = completed
        self.priority = priority
        self.plannedFor = plannedFor
    }
}
