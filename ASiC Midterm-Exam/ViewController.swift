//
//  ViewController.swift
//  ASiC Midterm-Exam
//
//  Created by Fu-Chiung HSU on 2019/3/29.
//  Copyright © 2019 Fu-Chiung HSU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var videoView: VideoView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func searchAction(_ sender: Any) {
        if searchTextField.text?.isEmpty == nil {
            
            videoView.configure(url: "https://s3-ap-northeast-1.amazonaws.com/mid-exam/Video/taeyeon.mp4")
            videoView.isLoop = true
            videoView.play()
            
        } else {
            guard let searchUrl: String = searchTextField.text else { return }
            videoView.configure(url: searchUrl)
            videoView.isLoop = true
            videoView.play()
        }
    }
    
}

