//
//  ModalView.swift
//  SwiftUiPractices
//
//  Created by Alok Upadhyay on 28/10/21.
//

import SwiftUI

struct ModalView: View {
    @Binding var presentedAsModal: Bool
    @Binding var count: Int

    var body: some View {
        Text("\(self.count)")
        Button("dismiss") { self.presentedAsModal = false }
        Button("increment") { self.count += 1 }
    }
}
