//
//  CustomTextfield.swift
//  ToDoList
//
//  Created by Георгий Асеев on 02.05.2025.
//

import SwiftUI

struct CustomTextfield: View {
    
    @EnvironmentObject var vm: ViewModel
    let placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $vm.newTaskName)
            .padding()
            .font(.headline)
            .background(.tdPrimary.opacity(0.15))
            .clipShape(.rect(cornerRadius: 16))
            .padding(.horizontal)
    }
}

#Preview {
    CustomTextfield(placeholder: "Напишите задачу")
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}
