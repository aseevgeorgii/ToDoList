//
//  PriorityTab.swift
//  ToDoList
//
//  Created by Георгий Асеев on 03.05.2025.
//

import SwiftUI

struct PriorityTab: View {
    
    @EnvironmentObject var vm: ViewModel
    @State var currentPriority = PriorityColor.veryImportant
    
    var priorityColor: Color {
        switch currentPriority {
        case .veryImportant: .red
        case .midImportant: .yellow
        case .notImportant: .green
        }
    }
    
    var body: some View {
            Image(systemName: "square.fill")
            .foregroundStyle(priorityColor)
    }
    
}

#Preview {
    PriorityTab()
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}


enum PriorityColor {
    case veryImportant
    case midImportant
    case notImportant
}
