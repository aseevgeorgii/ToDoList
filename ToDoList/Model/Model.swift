//
//  Model.swift
//  ToDoList
//
//  Created by Георгий Асеев on 29.04.2025.
//

import Foundation

struct TaskModel: Identifiable, Codable {
    var id = UUID()
    var title: String
    var description: String
    var isCompleted: Bool = false
}
