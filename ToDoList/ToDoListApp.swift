//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Георгий Асеев on 28.04.2025.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    @StateObject var vm = ViewModel()
    @AppStorage("isDarkMode") private var isDarkMode = true
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
