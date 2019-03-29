//
//  JQButton.swift
//  ASiC Midterm-Exam
//
//  Created by Fu-Chiung HSU on 2019/3/29.
//  Copyright © 2019 Fu-Chiung HSU. All rights reserved.
//

import UIKit

class JQButton {
    
    static let shared = JQButton()
    
    func buttonBorder(button: UIButton) {
        
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
    
    }
}
