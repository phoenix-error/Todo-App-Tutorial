//
//  TodoListView.swift
//  Todo App
//
//  Created by Luca Becker on 08.10.23.
//

import SwiftUI
import SwiftData

struct TodoListView: View {
    @Environment(AppState.self) var appState
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \TodoItem.plannedFor) var todoItems: [TodoItem]
    
    var filteredTodoItems: [TodoItem] {
        return todoItems.filter {
            $0.completed == (self.appState.selectedList == .completed) &&
            Calendar.current.isDate($0.plannedFor, equalTo: self.appState.selectedDate, toGranularity: .day)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            HStack {
                ForEach(TodoList.allCases, id: \.title) { todoListType in
                    Button {
                        withAnimation {
                            appState.selectedList = todoListType
                        }
                    } label: {
                        Text(todoListType.title)
                            .foregroundStyle(appState.selectedList == todoListType ? .main: .black)
                            .font(appState.selectedList == todoListType ? .title2 : .body)
                            .fontWeight(.medium)
                    }
                }
                
                Spacer()
            }
            
            List(filteredTodoItems) { todo in
                Text(todo.title)
                    .if(appState.selectedList == .completed, transform: { text in
                        text
                            .strikethrough(true)
                            .foregroundStyle(.secondary)
                    })
                    .onLongPressGesture {
                        todo.completed.toggle()
                    }
                    .swipeActions {
                        Button("Delete", systemImage: "trash", role: .destructive) {
                            modelContext.delete(todo)
                        }
                    }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            
            Spacer()
        }
    }
}

#Preview {
    TodoListView()
}
