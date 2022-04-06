//
//  VidoeView.swift
//  Tamagotchi
//
//  Created by Mees Rootjes on 30/03/2022.
//

import UIKit
import AVKit

final class VidoeView: UIView{
    
    var player: AVPlayer!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "TamagotchiVidoe", ofType: "mp4")!))
        
        let vidoeLayer = AVPlayerLayer(player: player)
        vidoeLayer.videoGravity = .resizeAspectFill
        vidoeLayer.name = "vidoeLayer"
    
        player.isMuted = true
        
        layer.addSublayer(vidoeLayer)
        
    }
}
