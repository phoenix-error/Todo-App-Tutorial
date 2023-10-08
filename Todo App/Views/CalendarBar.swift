//
//  CalendarBar.swift
//  Todo App
//
//  Created by Luca Becker on 08.10.23.
//

import SwiftUI

struct CalendarBar: View {
    @Environment(AppState.self) var appState
    
    var body: some View {
        VStack(alignment: .leading) {
            DateHeaderView()
            
            HStack {
                ForEach(0..<7) { ind in
                    let date = addDays(days: ind)
                    DayItemView(date: date)
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            appState.selectedDate = date
                        }
                }
            }
        }
    }
    // Calculates the dates for the Calendar bar based on todays date
    func addDays(days: Int) -> Date {
        let today = Date()
        return Calendar.current.date(byAdding: .day, value: days, to: today)!
    }
}

#Preview {
    CalendarBar()
        .environment(AppState())
}
