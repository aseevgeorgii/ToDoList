//
//  ViewModel.swift
//  ToDoList
//
//  Created by Георгий Асеев on 30.04.2025.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var tasks: [TaskModel] = [] {
        didSet {
            saveTask()
        }
    }
    @Published var newTaskName = ""
    @Published var description = ""
    @Published var selectedTask: TaskModel?

    let keyUD = "keyUD"
    
    var completion: Double {
        let totalTasks = tasks.count
        let completedTasks = tasks.filter({ $0.isCompleted }).count
        return totalTasks > 0 ? Double(completedTasks) / Double(totalTasks) : 0
    }
    
    
    init() {
        getTasks()
    }
    
    func getTasks() {
        guard let data = UserDefaults.standard.data(forKey: keyUD) else { return }
        do {
            let decodeTask = try JSONDecoder().decode([TaskModel].self, from: data)
            DispatchQueue.main.async {
                self.tasks = decodeTask
            }
        } catch {
            print("error")
        }
    }
    
    func saveTask() {
        do {
            let encodeTask = try JSONEncoder().encode(tasks)
            UserDefaults.standard.set(encodeTask, forKey: keyUD)
        } catch {
            print("error")
        }
    }
    
    func addTask(task: String, description: String) {
        let newTask = TaskModel(title: task, description: description)
        tasks.append(newTask)
    }
    
    func isCompletedTask(task: TaskModel) {
        if let index = tasks.firstIndex(where: { $0.id == task.id}) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    func deleteTask(task: IndexSet) {
        tasks.remove(atOffsets: task)
    }
    
    func updateTask(id: UUID, title: String, description: String) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].title = title
            tasks[index].description = description
        }
    }
    
}
