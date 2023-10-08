//
//  AddItemPopupView.swift
//  Todo App
//
//  Created by Luca Becker on 09.10.23.
//

import SwiftUI
import SwiftData

struct AddItemPopupView: View {
    @Environment(\.modelContext) var modelContext
    
    @ScaledMetric var size: CGFloat = 1
    
    @Binding var isDisplayed: Bool
    @State private var title: String = "New Task"
    @State private var date: Date = Date()
    @State private var priority: TodoPriority = .none
    
    var body: some View {
            Form {
                TextField("New task", text: $title)
                
                Section {
                    DatePicker(selection: $date, displayedComponents: .date) {
                        Label("Date", systemImage: "calendar")
                            .labelStyle(ColoredIconLabelStyle(color: .blue, size: size))
                    }
                    Picker(selection: $priority) {
                        ForEach(TodoPriority.allCases, id: \.self) { priority in
                            Text(priority.rawValue)
                                .tag(priority)
                        }
                    } label: {
                        Label("Priority", systemImage: "exclamationmark")
                            .labelStyle(ColoredIconLabelStyle(color: .red,  size: size))
                    }
                }
                
                Button("Add Task") {
                    let todoItem = TodoItem(title: title, priority: priority, plannedFor: date)
                    
                    modelContext.insert(todoItem)
                    
                    do {
                        try modelContext.save()
                    } catch {
                        fatalError("Cannot save TodoItem")
                    }
                    isDisplayed.toggle()
                }
            }
            .scrollDisabled(true)
            .cornerRadius(40, corners: [.topLeft, .topRight])
    }
}

#Preview {
    AddItemPopupView(isDisplayed: .constant(true))
}
