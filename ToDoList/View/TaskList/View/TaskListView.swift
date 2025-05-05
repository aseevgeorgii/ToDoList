//
//  TaskListView.swift
//  ToDoList
//
//  Created by Георгий Асеев on 29.04.2025.
//

import SwiftUI

struct TaskListView: View {
    
    @EnvironmentObject var vm: ViewModel
    @State private var isEditViewPresented = false
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                
                if vm.tasks.isEmpty {
                    NoTaskView()
                } else {
                    VStack {
                        List {
                            ForEach(vm.tasks) { task in
                                TaskRow(model: task) {
                                    vm.isCompletedTask(task: task)
                                }
                                .onTapGesture {
                                    vm.selectedTask = task
                                    isEditViewPresented = true
                                }
                            }
                            .onDelete(perform: vm.deleteTask)
                            .sheet(isPresented: $isEditViewPresented) {
                                if let taskToEdit = vm.selectedTask {
                                    EditTaskView(task: taskToEdit)
                                        .presentationDetents([.height(360)])
                                }
                            }
                        }
                        .listStyle(.plain)
                        ProgressView("Выполнено", value: vm.completion)
                            .padding(.horizontal, 40)
                            .font(.headline)
                            .tint(.tdPrimary)
                            .frame(height: 60)
                    }
                }
            }
            .navigationTitle("Список дел")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: AddTaskView()) {
                        Image(systemName: "plus")
                            .foregroundStyle(.tdPrimary)
                    }
                }
            }
        }
    }
}

#Preview {
    TaskListView()
        .preferredColorScheme(.dark)
        .environmentObject(ViewModel())
}
