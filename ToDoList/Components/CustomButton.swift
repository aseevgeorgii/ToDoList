//
//  CustomButton.swift
//  ToDoList
//
//  Created by Георгий Асеев on 02.05.2025.
//

import SwiftUI

struct CustomButton: View {
    
    @EnvironmentObject var vm: ViewModel
    @Environment(\.dismiss) private var dismiss
    let buttonTitle: String
    let action: () -> ()

    var body: some View {
        Button {
            action()
            dismiss()
        } label: {
            Text(buttonTitle)
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.tdAccent)
                .foregroundStyle(.white)
                .clipShape(.rect(cornerRadius: 16))
        }
        .padding(.horizontal)
    }
}

#Preview {
    CustomButton(buttonTitle: "Добавить задачу") {}
        .environmentObject(ViewModel())
        .preferredColorScheme(.dark)
}
