//
//  PriorityDotsView.swift
//  Todo App
//
//  Created by Luca Becker on 08.10.23.
//

import SwiftUI

struct PriorityDotsView: View {
    var body: some View {
        VStack(spacing: 2) {
            Circle().fill(Color.priorityHigh)
            Circle().fill(Color.priorityLow)
            Circle().fill(Color.priorityMedium)   
        }
    }
}

#Preview {
    PriorityDotsView()
}
