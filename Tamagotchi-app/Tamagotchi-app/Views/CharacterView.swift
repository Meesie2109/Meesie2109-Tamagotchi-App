//
//  CharacterView.swift
//  Tamagotchi-app
//
//  Created by Mees Rootjes on 09/03/2022.
//

import UIKit

class CharacterView: UIView {

    private let label: UIImageView = {
        let label = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        label.image = UIImage(named: "redEgg")
        label.contentMode = .scaleAspectFill

        return label
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
//        backgroundColor = .red
        
        let backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        backgroundImage.image = UIImage(named: "redEgg")
        backgroundImage.contentMode = .scaleAspectFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        backgroundImage.image = UIImage(named: "redEgg")
        backgroundImage.contentMode = .scaleAspectFill
        
        label.frame = CGRect(
            x: 10,
            y: 10,
            width: frame.size.width - 20,
            height: frame.size.height - 20
        )
    }
    
}
