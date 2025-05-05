//
//  StartView.swift
//  ToDoList
//
//  Created by Георгий Асеев on 02.05.2025.
//

import SwiftUI

struct NoTaskView: View {
    var body: some View {
        VStack {
            
            Text("У Вас пока нет задач\nДобавьте их!")
                .fontWeight(.bold)
                .font(.system(size: 32))
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            
            NavigationLink(destination: AddTaskView()) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.tdPrimary.opacity(0.25))
                    .frame(width: 100, height: 100)
            }
        }
    }
}

#Preview {
    NoTaskView()
        .preferredColorScheme(.dark)
}




