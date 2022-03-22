//
//  CharacterView.swift
//  Tamagotchi-app
//
//  Created by Mees Rootjes on 09/03/2022.
//

import UIKit

class CharacterView: UIView {
    
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
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var status = ""
    public func configure(statusCharacter: String){
        status = statusCharacter
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let eggView = getImage(width: 120, height: 170)
        eggView.center = self.center
        eggView.contentMode = .scaleAspectFill
        eggView.tag = 212
        eggView.image = UIImage(named: "yellowEgg")
        eggView.center = CGPoint(x: 160,
                                     y: 300)
        
        
        if(status == "InEgg"){
            self.addSubview(eggView)
            
        }
    }
    
    
}
