//
//  APIExampleView.swift
//  SwiftUiPractices
//
//  Created by Alok Upadhyay on 29/10/21.
//

import SwiftUI

struct APIExampleView: View {
    @StateObject var apiVm = TodoApiViewModel()

    var body: some View {
        
        VStack {
            List {
                ForEach(self.apiVm.arr) { todo in
                    Text(todo.title)
                }
            }
        }.onAppear() {
            apiVm.fetch()
        }
    }
}

struct APIExampleView_Previews: PreviewProvider {
    static var previews: some View {
        APIExampleView()
    }
}
