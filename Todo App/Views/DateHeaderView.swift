//
//  DateHeaderView.swift
//  Todo App
//
//  Created by Luca Becker on 08.10.23.
//

import SwiftUI

struct DateHeaderView: View {
    @Environment(AppState.self) var appState
    var body: some View {
        VStack(alignment: .leading) {
            Text(appState.selectedDate.formatted(.dateTime.year()))
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
            Text(appState.selectedDate.formatted(.dateTime.month(.wide).day()))
                .font(.title)
                .fontWeight(.bold)
        }
        .onTapGesture {
            appState.selectedDate = Date()
        }
    }
}

#Preview {
    DateHeaderView()
}
