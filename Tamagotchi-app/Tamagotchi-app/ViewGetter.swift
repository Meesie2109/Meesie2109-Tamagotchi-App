//
//  ViewGetter.swift
//  Tamagotchi-app
//
//  Created by Mees Rootjes on 22/03/2022.
//

import Foundation
import UIKit

class viewGetter: UIViewController{
    
    func getEggImage() -> CharacterView{
        let view = CharacterView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: 400,
                height: 450
            )
        )
        
        return view
    }
    
    func getGestureView() -> GestureView{
        let view = GestureView(
            frame: CGRect(
                x: 0,
                y: 50,
                width: 400.0,
                height: 450.0
        ))

        return view
    }
    
    func getCharacterEggView(number: Int) -> CharacterView{
        if(number == 0){
            let yellowEgg = getEggImage()
            yellowEgg.configure(characterPicture: "yellowEgg", characterHeight: 120, characterWidth: 120)
            return yellowEgg
        } else if(number == 1){
            let greenEgg = getEggImage()
            greenEgg.configure(characterPicture: "greenEgg", characterHeight: 120, characterWidth: 120)
            return greenEgg
        } else if(number == 2){
            let redEgg = getEggImage()
            redEgg.configure(characterPicture: "redEgg", characterHeight: 120, characterWidth: 120)
            return redEgg
        }
        
        return getCharacterEggView(number: number)
    }
    
    func getCharacterPichuView(number: Int) -> CharacterView{
        if(number == 0 || number == 2){
            let pichu = getEggImage()
            pichu.configure(characterPicture: "pichu", characterHeight: 200, characterWidth: 200)
            return pichu
        } else if(number == 1) {
            let pichuWithCrown = getEggImage()
            pichuWithCrown.configure(characterPicture: "pichuWithCrown", characterHeight: 200, characterWidth: 200)
            return pichuWithCrown
        }
        
        return getCharacterPichuView(number: number)
    }
    
    func getTapText() -> UILabel{
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.text = ""
        label.center = CGPoint(x: 160, y: 485)
        label.textAlignment = .center
        label.tag = 243
        
        return label
    }
}
