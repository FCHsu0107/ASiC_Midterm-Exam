//
//  UIImage.swift
//  ASiC Midterm-Exam
//
//  Created by Fu-Chiung HSU on 2019/3/29.
//  Copyright © 2019 Fu-Chiung HSU. All rights reserved.
//


import UIKit

enum ImageAsset: String {
    
    case Icons_play
    case Icons_pause
    
    case Icons_rewind
    case Icons_fastForward
    
    case Icons_mute
    case Icons_speaker
    
    case Icons_fullscreen
    
}

extension UIImage {
    
    static func asset(_ asset: ImageAsset) -> UIImage? {
        
        return UIImage(named: asset.rawValue)
    }
}
