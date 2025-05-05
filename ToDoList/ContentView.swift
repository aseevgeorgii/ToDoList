//
//  ContentView.swift
//  ToDoList
//
//  Created by Георгий Асеев on 28.04.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TaskListView()
    }
}

#Preview {
    ContentView()
        .environmentObject(ViewModel())
}
