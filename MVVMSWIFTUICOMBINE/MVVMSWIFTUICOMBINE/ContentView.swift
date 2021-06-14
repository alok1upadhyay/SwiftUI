//
//  ContentView.swift
//  MVVMSWIFTUICOMBINE
//
//  Created by Alok Deepti on 10/06/21.
//  Copyright © 2021 Alok. All rights reserved.
//

import SwiftUI

struct ContentView: View { 
    
    @ObservedObject var vm = ViewMOdel.init()
    @State var isPesented = false
    @State var selectedTitle: String?
    
    var body: some View {
        VStack {
            
            List(self.vm.datasourceArray ?? [Todo]()) {todo in
                Button(action: {
                    self.selectedTitle = todo.title
                    self.isPesented.toggle()
                }, label: {
                    Text(todo.title)
                })
            }
            .onAppear() {
            self.vm.fetch(decodingType: [Todo].self, url: URL(string: "https://jsonplaceholder.typicode.com/todos/")!)
        }
                .sheet(isPresented: $isPesented) {  DetailView(receivedValue: self.selectedTitle ?? "") }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
