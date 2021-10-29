//
//  ACustomView.swift
//  SwiftUiPractices
//
//  Created by Alok Upadhyay on 30/10/21.
//

import UIKit

class ACustomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        backgroundColor = .blue
    }
    
}
