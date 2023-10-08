//
//  TodoList.swift
//  Todo App
//
//  Created by Luca Becker on 09.10.23.
//

import Foundation

enum TodoList: String, CaseIterable, Codable {
    case today
    case completed
    
    var title: String {
        switch self {
        case .today:
            return "Today's Tasks"
        case .completed:
            return "Completed"
        }
    }
}
