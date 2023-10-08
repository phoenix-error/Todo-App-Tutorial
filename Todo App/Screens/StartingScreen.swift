//
//  StartingScreen.swift
//  Todo App
//
//  Created by Luca Becker on 08.10.23.
//

import SwiftUI

struct StartingScreen: View {
    @AppStorage("isOnboarding") var isOnboarding = true
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                PriorityDotsView()
                    .frame(height: 50)
                Text("Todo")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            
            Text("Stay organized and productive")
                .font(.callout)
                .fontWeight(.medium)
            
            Spacer()
            
            LargeButton {
                withAnimation {
                    isOnboarding = false
                }
            } label: {
                HStack {
                    Text("Get Started")
                        .fontWeight(.medium)
                    Image(systemName: "arrow.right")
                        .fontWeight(.bold)
                }
            }
        }
        .padding()
        
    }
}

#Preview {
    StartingScreen()
}
