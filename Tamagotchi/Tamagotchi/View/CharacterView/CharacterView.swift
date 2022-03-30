//
//  CharacterView.swift
//  Tamagotchi
//
//  Created by Mees Rootjes on 30/03/2022.
//

import UIKit

final class CharacterView: UIView{
    
    let ViewModel = CharacterViewModel()
    
    func Character() -> UIImageView{
        let character = UIImageView()
        character.frame =  CGRect(x:  0, y: 0, width: 250, height: 250)
        character.center = CGPoint(x: 160, y: 380)
        character.contentMode = .scaleAspectFill
        character.tag = 2
        character.image = UIImage(named: "eggImageOne")
        
        return character
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(Character())
    }
}
