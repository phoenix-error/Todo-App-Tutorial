//
//  DayItemView.swift
//  Todo App
//
//  Created by Luca Becker on 08.10.23.
//

import SwiftUI

struct DayItemView: View {
    @Environment(AppState.self) var appState
    let date: Date
    
    var enabled: Bool {
        return Calendar.current.isDate(date, equalTo: appState.selectedDate, toGranularity: .day)
    }
    
    var body: some View {
        VStack {
            Text(date.formatted(.dateTime.day(.twoDigits)))
            Text(date.formatted(.dateTime.weekday(.narrow)))
                .foregroundStyle(.secondary)
        }
        .padding(10)
        .if(enabled) { item in
            item.overlay {
                Capsule().stroke(Color.main, lineWidth: 2.0)
            }
        }
    }
}

#Preview {
    DayItemView(date: Date())
}
