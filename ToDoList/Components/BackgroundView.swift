//
//  BackgroundView.swift
//  ToDoList
//
//  Created by Георгий Асеев on 02.05.2025.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(colors: [.toDoBackground1, .toDoBackground2],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
