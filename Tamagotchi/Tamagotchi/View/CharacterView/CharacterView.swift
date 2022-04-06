//
//  CharacterView.swift
//  Tamagotchi
//
//  Created by Mees Rootjes on 30/03/2022.
//

import UIKit

final class CharacterView: UIView{
    
    let ViewModel = CharacterViewModel()
    
    func Character(image: String) -> UIImageView{
        let character = UIImageView()
        character.frame =  CGRect(x:  0, y: 0, width: 250, height: 250)
        character.center = CGPoint(x: 160, y: 380)
        character.contentMode = .scaleAspectFill
        character.image = UIImage(named: image)
        
        return character
    }
    
    var RandomNumber = -99
    public func configure(number: Int){
        RandomNumber = number
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let image = ViewModel.getEggViewImage(number: RandomNumber)
        let character = Character(image: image)
        addSubview(character)
    }
}
