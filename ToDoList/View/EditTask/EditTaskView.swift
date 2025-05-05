//
//  EditTaskView.swift
//  ToDoList
//
//  Created by Георгий Асеев on 02.05.2025.
//

import SwiftUI

struct EditTaskView: View {
    
    @EnvironmentObject var vm: ViewModel
    @Environment(\.dismiss) private var dismiss
    var task: TaskModel
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                HStack(alignment: .center) {
                    Text("Изменить название")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                    
                        .overlay(alignment: .leading) {
                            Button {
                                dismiss()
                            } label: {
                                Text("Закрыть")
                            }
                        }
                        .padding(.vertical)
                }
                .padding(.horizontal)
                
                CustomTextfield(placeholder: "Изменить")
                DescriptionTextfield()
                CustomButton(buttonTitle: "Сохранить изменения") {
                    vm.updateTask(id: task.id, title: vm.newTaskName, description: vm.description)
                }
                Spacer()
            }
        }
        .onAppear {
            vm.newTaskName = task.title
            vm.description = task.description
        }
    }
}

#Preview {
    EditTaskView(task: TaskModel(title: "test", description: "testDesc"))
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}
