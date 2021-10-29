//
//  UIKItWrapperExample.swift
//  SwiftUiPractices
//
//  Created by Alok Upadhyay on 30/10/21.
//

import SwiftUI

struct UIKItWrapperExample: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = AViewController
    
    func updateUIViewController(_ uiViewController: AViewController, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> AViewController {
                let vc = AViewController.init()
                return vc
    }
}
