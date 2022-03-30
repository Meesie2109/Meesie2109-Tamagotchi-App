//
//  TamagotchiView.swift
//  Tamagotchi
//
//  Created by Mees Rootjes on 30/03/2022.
//

import UIKit

final class TamagotchiView: UIView{
    
    let ViewModel = TamagotchiViewModel()
    
    func Character(image: String) -> UIImageView{
        let character = UIImageView()
        character.frame =  CGRect(x:  0, y: 0, width: 250, height: 350)
        character.center = CGPoint(x: 160, y: 320)
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
        
        let image = ViewModel.getTamagotchiViewImage(number: RandomNumber)
        let character = Character(image: image)
        addSubview(character)
    }
}
