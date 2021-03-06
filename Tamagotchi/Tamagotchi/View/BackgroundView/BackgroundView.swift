//
//  BackgroundView.swift
//  Tamagotchi
//
//  Created by Mees Rootjes on 29/03/2022.
//

import UIKit

final class BackgroundView: UIView{
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = .scaleAspectFill
        insertSubview(backgroundImage, at: 0)
        
    }
}
