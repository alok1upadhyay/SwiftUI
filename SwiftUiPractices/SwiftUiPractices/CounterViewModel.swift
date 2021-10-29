//
//  TodoViewModel.swift
//  SwiftUiPractices
//
//  Created by Alok Upadhyay on 29/10/21.
//

import Foundation

class CounterModel: ObservableObject {
    @Published var count = 0 //view model
    
    func increment()  {
        self.count += 1
    }
}

class TodoViewModel: ObservableObject {
    @Published var arr = [Todo]()
    
    func addTodo(todo: Todo)  {
        self.arr.append(todo)
    }
}
