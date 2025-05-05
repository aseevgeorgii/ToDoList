//
//  DescriptionTextfield.swift
//  ToDoList
//
//  Created by Георгий Асеев on 03.05.2025.
//

import SwiftUI

struct DescriptionTextfield: View {
    
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if vm.description.isEmpty {
                Text("Введите описание задачи")
                    .foregroundStyle(.tdPrimary.opacity(0.2))
                    .font(.headline)
                    .padding(.horizontal, 28)
                    .padding(.vertical, 16)
            }
            
            TextEditor(text: $vm.description)
                .scrollContentBackground(.hidden)
                .padding(8)
                .font(.headline)
                .background(.tdPrimary.opacity(0.15))
                .clipShape(.rect(cornerRadius: 16))
                .padding(.horizontal)
                .frame(height: 160)
        }
    }
}

#Preview {
    DescriptionTextfield()
        .preferredColorScheme(.dark)
        .environmentObject(ViewModel())
}
