//
//  DetailView.swift
//  SwiftUiPractices
//
//  Created by Alok Upadhyay on 28/10/21.
//

import SwiftUI

struct DetailView: View {
    var vTitle = "Defaullt"
     @State var someThingMutable = "initial"
    
    var body: some View {
        Text(vTitle)
        Text(someThingMutable)
        Button("mutate normal prop", action: {
            self.someThingMutable =  self.someThingMutable + "trying to change"
        } )
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
