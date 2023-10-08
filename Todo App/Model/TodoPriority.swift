//
//  TodoPriority.swift
//  Todo App
//
//  Created by Luca Becker on 08.10.23.
//

import Foundation

// Has to conform to Codable for TodoItem (SwiftData)
enum TodoPriority: String, CaseIterable, Codable {
    case none
    case low
    case medium
    case high
}
