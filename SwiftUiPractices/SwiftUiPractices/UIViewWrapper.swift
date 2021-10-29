//
//  UIViewWrapper.swift
//  SwiftUiPractices
//
//  Created by Alok Upadhyay on 30/10/21.
//

import SwiftUI

struct UIViewWrapper: UIViewRepresentable {
    typealias UIViewType = ACustomView
    
    func makeUIView(context: Context) -> ACustomView {
        let v = ACustomView.init(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        return v
    }
    func updateUIView(_ uiView: ACustomView, context: Context) {
        
    }
}
