//
//  LargeButton.swift
//  Todo App
//
//  Created by Luca Becker on 08.10.23.
//

import SwiftUI

struct LargeButton<Content: View>: View {
    let action: () -> Void
    let content: Content
    
    init(action: @escaping () -> Void, @ViewBuilder label: () -> Content){
        self.action = action
        self.content = label()
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            content
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .background(Color.main)
                .clipShape(RoundedRectangle(cornerRadius: 12.0))
        }
    }
}

#Preview {
    LargeButton {
        
    } label: {
        HStack {
            Text("Get Started")
                .fontWeight(.medium)
            Image(systemName: "arrow.right")
                .fontWeight(.bold)
        }
    }
    
}
