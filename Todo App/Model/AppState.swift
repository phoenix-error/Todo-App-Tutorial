//
//  AppState.swift
//  Todo App
//
//  Created by Luca Becker on 09.10.23.
//

import SwiftUI
import SwiftData

@Observable class AppState {
    var selectedDate = Date()
    var selectedList: TodoList = .today
}
