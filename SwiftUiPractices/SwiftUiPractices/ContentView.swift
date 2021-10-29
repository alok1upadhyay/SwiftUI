//
//  ContentView.swift
//  SwiftUiPractices
//
//  Created by Alok Upadhyay on 28/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var count  = 0
    @State var presentingModal = false
    @State var isPush = false
    @State var isPushThroughButton = false
    @StateObject var vm = CounterModel()
    @StateObject var tdvm = TodoViewModel()
    var arrRandom = [Todo(id: Date(), name: "swim"),  Todo(id: Date(), name: "bolly"),  Todo(id: Date(), name: "skate"), Todo(id: Date(), name: "parag")]
    
    var body: some View {
        NavigationView {
            VStack {
                Group {
                    Group {
                        Button("increment through view model", action: {
                            vm.increment()
                        } )
                        Text("increment through view model = > \(self.vm.count)")
                    }.background(Color.pink)
                    
                    Group() {
                        Text("\(self.count)")
                        Button("increment", action: {
                            self.count = self.count + 1
                        } )
                        Button("decrement", action: {
                            self.count = self.count - 1
                        } )
                    }.background(Color.yellow)
                    
                    Button("push through button", action: {
                        self.isPushThroughButton = true
                    } )
                    Group() {
                        List {
                            ForEach(self.tdvm.arr) { todo in
                                Text(todo.name)
                            }
                        }
                        Button("add todo") {
                            self.tdvm.addTodo(todo: arrRandom.randomElement()!)
                        }
                    }.background(Color.gray)
                }
                NavigationLink(destination: DetailView(), isActive: $isPushThroughButton) {
                                    EmptyView()
                                }
                
                NavigationLink(
                    destination: Text("Detail"), // <1>
                    label: {
                        Text("Open Text Detail") // <5>
                    })
                NavigationLink(
                    destination: DetailView(vTitle: "Passed from Prev screen"), // <1>
                    label: {
                        Text("Open Detail View") // <5>
                    })
                NavigationLink(
                    destination: APIExampleView(), // <1>
                    label: {
                        Text("API example") // <5>
                    })
                NavigationLink(
                    destination: UIKItWrapperExample(), // <1>
                    label: {
                        Text("open UIKIT VC example") // <5>
                    })
                NavigationLink(
                    destination: UIViewWrapper(), // <1>
                    label: {
                        Text("open UIKIT custom view example") // <5>
                    })
                
                HStack {
                    Button("Open") {
                        self.presentingModal = true
                    }
                    
                }
                
                .sheet(isPresented: $presentingModal) { ModalView(presentedAsModal: self.$presentingModal, count: self.$count)}
            }        .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)

        }
//        .navigationTitle("Home")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Todo: Identifiable {
    var id = Date()
    
    let name: String
}
