//
//  TodoApiViewModel.swift
//  SwiftUiPractices
//
//  Created by Alok Upadhyay on 29/10/21.
//

import Foundation
import Combine
class TodoApiViewModel: ObservableObject {
    
    @Published var arr = [TodoModel]() //view model
    @Published var error : Error?
    private var cancellable: AnyCancellable?

    func fetch() {
        self.cancellable = URLSession.shared.dataTaskPublisher(for: URL.init(string: "https://jsonplaceholder.typicode.com/todos/")!)
            .tryMap { data,response in
                return data
            }
            .decode(type: [TodoModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                        case .finished:
                            break
                        case .failure(let error):
                            self.error = error
                            print(error.localizedDescription)
                        }
            } receiveValue: { arrTodoModel in
                self.arr = arrTodoModel
            }

    }
}

struct TodoModel: Codable, Identifiable {
    let title : String
    let id : Int
    
}
