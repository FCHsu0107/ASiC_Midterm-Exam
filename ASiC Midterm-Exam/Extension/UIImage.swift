//
//  UIImage.swift
//  ASiC Midterm-Exam
//
//  Created by Fu-Chiung HSU on 2019/3/29.
//  Copyright © 2019 Fu-Chiung HSU. All rights reserved.
//


import UIKit

enum ImageAsset: String {
    
    case play_button
    case stop
    
    case rewind
    case fast_forward
    
    case volume_off
    case volume_up
    
    case full_screen_button
    case full_screen_exit
    
}

extension UIImage {
    
    static func asset(_ asset: ImageAsset) -> UIImage? {
        
        return UIImage(named: asset.rawValue)
    }
}
