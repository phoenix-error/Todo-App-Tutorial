//
//  MainScreen.swift
//  Todo App
//
//  Created by Luca Becker on 08.10.23.
//

import SwiftUI
import Observation
import PopupView

struct MainScreen: View {
    var appState = AppState()
    @State private var showPopup = false
    var body: some View {
        VStack {
            CalendarBar()
                .padding(.bottom)
            
            TodoListView()
            
            LargeButton {
                showPopup.toggle()
            } label: {
                Text("Add Item")
                    .fontWeight(.medium)
            }
        }
        .padding()
        .navigationBarBackButtonHidden()
        .environment(appState)
        .popup(isPresented: $showPopup) {
            AddItemPopupView(isDisplayed: $showPopup)
                .shadow(color: .black.opacity(0.08), radius: 2, x: 0, y: 0)
                .shadow(color: .black.opacity(0.16), radius: 24, x: 0, y: 0)
                .padding(.top)
                .frame(height: 400)
                .clipShape(RoundedRectangle(cornerRadius: 12.0))
                
        } customize: {
            $0
                .type(.toast)
                .position(.bottom)
                .useKeyboardSafeArea(true)
                .closeOnTap(false)
                .closeOnTapOutside(true)
                .dragToDismiss(true)
                .backgroundColor(.black.opacity(0.4))
        }
    }
}

#Preview {
    MainScreen()
}
