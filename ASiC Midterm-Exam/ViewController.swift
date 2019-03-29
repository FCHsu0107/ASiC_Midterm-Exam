//
//  ViewController.swift
//  ASiC Midterm-Exam
//
//  Created by Fu-Chiung HSU on 2019/3/29.
//  Copyright © 2019 Fu-Chiung HSU. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var videoView: VideoView!
    
    @IBOutlet weak var searchBtn: UIButton!
    
    @IBOutlet weak var timeSlider: UISlider!
    
    @IBOutlet weak var currentTimeLabel: UILabel!
    
    @IBOutlet weak var totalTimeLabel: UILabel!
    
    @IBOutlet weak var playBtn: UIButton!
    
    var isVideoPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        JQButton.shared.buttonBorder(button: searchBtn)
        
        JQButton.shared.setImage(button: playBtn, normalImage: UIImage.asset(.stop), selectedImage: UIImage.asset(.play_button))
        
        videoView.player?.currentItem?.addObserver(self, forKeyPath: "duration", options: [.new, .initial], context: nil)
        
        
    }
    
    //status bar style
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
    
    func addTimeObserver() {
        guard let player = videoView.player else { return }
        let interval = CMTime(seconds: 0.5, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        let mainQueue = DispatchQueue.main
        _ = player.addPeriodicTimeObserver(forInterval: interval, queue: mainQueue, using: { [weak self] time in
            guard let currentItem = player.currentItem else {return}
            self?.timeSlider.maximumValue = Float(currentItem.duration.seconds)
            self?.timeSlider.minimumValue = 0
            self?.timeSlider.value = Float(currentItem.currentTime().seconds)
//            self?.currentTimeLabel.text = self?.getTimeString(from: currentItem.currentTime())
        })
    }
    
    @IBAction func searchAction(_ sender: Any) {
        
        videoView.isHidden = false
        
        if searchTextField.text?.isEmpty == true {
            
            videoView.configure(url: "https://s3-ap-northeast-1.amazonaws.com/mid-exam/Video/taeyeon.mp4")
            videoView.play()
            
        } else {
            guard let searchUrl: String = searchTextField.text else { return }
            
            videoView.configure(url: searchUrl)
            videoView.isLoop = true
            videoView.play()
        }
    }
    
    @IBAction func playPressed(_ sender: Any) {
        
        if playBtn.isSelected == true {
            
            videoView.play()
            playBtn.isSelected = false
            
        } else {
            
            videoView.pause()
            playBtn.isSelected = true
            
        }
    }
    
    @IBAction func forwardPressed(_ sender: Any) {
        videoView.forward(time: 10.0)
    }

    
    @IBAction func backwardPressed(_ sender: Any) {
        videoView.backward(time: 10.0)
    }
    
    @IBAction func silderValueChange(_ sender: Any) {
    }
}

