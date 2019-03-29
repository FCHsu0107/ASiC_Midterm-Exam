//
//  VideoView.swift
//  ASiC Midterm-Exam
//
//  Created by Fu-Chiung HSU on 2019/3/29.
//  Copyright © 2019 Fu-Chiung HSU. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoView: UIView {
    
    var playerLayer: AVPlayerLayer?
    
    var player: AVPlayer?
    
    var isLoop: Bool = false
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure(url: String) {
        guard let videoUrl = URL(string: url) else { return }
        
        player = AVPlayer(url: videoUrl)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.frame = bounds
        playerLayer?.videoGravity = AVLayerVideoGravity.resize
        
        guard let playerLayer = self.playerLayer else { return }
        layer.addSublayer(playerLayer)
        
        NotificationCenter.default.addObserver(self, selector: #selector(reachTheEndOfTheVideo(_:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
    }
    
    func play() {
        if player?.timeControlStatus != AVPlayer.TimeControlStatus.playing {
            player?.play()
        }
    }
    
    func pause() {
        player?.pause()
    }
    
    func stop() {
        player?.pause()
        player?.seek(to: CMTime.zero)
    }
    
    @objc func reachTheEndOfTheVideo(_ notification: Notification) {
        if isLoop {
            player?.pause()
            player?.seek(to: CMTime.zero)
            player?.play()
        }
    }
}
