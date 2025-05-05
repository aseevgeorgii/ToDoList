//
//  AddTaskView.swift
//  ToDoList
//
//  Created by Георгий Асеев on 29.04.2025.
//

import SwiftUI

struct AddTaskView: View {
    
    @EnvironmentObject var vm: ViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            
            BackgroundView()
            
            VStack {
                CustomTextfield(placeholder: "Напишите задачу")
                DescriptionTextfield()
                CustomButton(buttonTitle: "Добавить задачу") {
                    vm.addTask(task: vm.newTaskName, description: vm.description)
                }
                .disabled(vm.newTaskName.isEmpty)
                Spacer()
            }
            .padding(.top, 40)
        }
        .navigationTitle("Добавить задачу")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.headline)
                        .foregroundStyle(.tdAccent)
                }
            }
        }
        .onAppear() {
            vm.newTaskName = ""
            vm.description = ""
        }
    }
}

#Preview {
    NavigationView {
        AddTaskView()
            .preferredColorScheme(.dark)
            .environmentObject(ViewModel())
    }
}
