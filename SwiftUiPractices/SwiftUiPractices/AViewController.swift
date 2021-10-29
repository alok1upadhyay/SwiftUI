//
//  AViewController.swift
//  SwiftUiPractices
//
//  Created by Alok Upadhyay on 30/10/21.
//

import UIKit
import SwiftUI

class AViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .cyan
        
    }
    
    // i feel lazy please create a ui button and on click on button open HVC, see below
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let swiftUIView = ContentView.init()
        let hvc  = UIHostingController.init(rootView: swiftUIView)
        present(hvc, animated: true, completion: nil)
    }
}
