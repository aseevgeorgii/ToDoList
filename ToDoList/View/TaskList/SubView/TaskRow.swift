//
//  TaskRow.swift
//  ToDoList
//
//  Created by Георгий Асеев on 30.04.2025.
//

import SwiftUI

struct TaskRow: View {
    
    var model: TaskModel
    let action: () -> ()
    
    var body: some View {
        HStack {
            
            model.isCompleted
            ? Text(model.title).strikethrough().foregroundColor(.tdPrimary.opacity(0.5))
            : Text(model.title)
            
            Spacer()
            Button {
                action()
            } label: {
                Image(systemName: model.isCompleted ? "checkmark.circle.fill" : "circle")
            }
            .buttonStyle(.borderless)
        }
        .font(.headline)
        .padding()
        .background(model.isCompleted ? .tdPrimary.opacity(0.1) : .tdPrimary.opacity(0.25))
        .clipShape(.rect(cornerRadius: 16))
        .listRowInsets(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
    }
}

#Preview {
    List {
        TaskRow(model: TaskModel(title: "task1", description: "testDesc1", isCompleted: true)) {}
        TaskRow(model: TaskModel(title: "task2", description: "testDesc2", isCompleted: false)) {}
    }
    .listStyle(.plain)
    .preferredColorScheme(.dark)

}
