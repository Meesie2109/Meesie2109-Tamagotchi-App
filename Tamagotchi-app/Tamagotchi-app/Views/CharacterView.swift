//
//  CharacterView.swift
//  Tamagotchi-app
//
//  Created by Mees Rootjes on 09/03/2022.
//

import UIKit

class CharacterView: UIView {
    
    var picture = ""
    var height = 0
    var width = 0
    
    func getImage(width: Int, height: Int) -> UIImageView{
        let usedView = UIImageView(
            frame: CGRect(
                x: 100,
                y: 0,
                width: width,
                height: height
            )
        )
        return usedView
    }

    public func configure(characterPicture: String, characterHeight: Int, characterWidth: Int){
        picture = characterPicture
        height = characterHeight
        width = characterWidth
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let characterView = getImage(width: height, height: width)
        characterView.center = self.center
        characterView.contentMode = .scaleAspectFill
        characterView.image = UIImage(named: picture)
        characterView.center = CGPoint(x: 160, y: 300)
        addSubview(characterView)
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
