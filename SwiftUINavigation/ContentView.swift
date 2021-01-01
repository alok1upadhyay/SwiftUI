//
//  ContentView.swift
//  SwiftUINavigation
//
//  Created by Alok Upadhyay on 16/09/20.
//  Copyright © 2020 Alok Upadhyay. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var counter : Int = 0
    
    var body: some View {
        
        NavigationView {
        VStack {
            Image("image")
            Text("Hello, World!")
            Text("counter \(counter)")
            Button(action: {
                self.counter = self.counter + 1
            }) {
                VStack {
                   
                    Text("Increment")
                }
        }
            NavigationLink(destination: ContentDetailView(counterFromParent: $counter)) {
                Image("image").resizable().renderingMode(.original).frame(width: 100, height: 100, alignment: .center)
                Text("open detail!")
            }
    }
}
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct ContentDetailView: View {
    
    @Binding var counterFromParent: Int
    @State var lcounterFromParent: Int = 0
    var body: some View {
        VStack {
            Text("Detail Screen \(lcounterFromParent)")
            Button(action: {
                    self.lcounterFromParent = self.lcounterFromParent - 1
                }) {
                    VStack {
                        Text("Decrement")
                    }
            }
            }
    .onAppear {
        print("ContentView appeared!")
        self.lcounterFromParent = self.counterFromParent
    }.onDisappear {
        print("ContentView disappeared!")
    }
    }
}

//struct ContentDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentDetailView(counterFromParent: <#T##Binding<Int>#>)
//    }
//}
