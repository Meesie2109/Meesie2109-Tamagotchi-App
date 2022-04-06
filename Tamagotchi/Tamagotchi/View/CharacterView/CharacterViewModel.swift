//
//  CharacterViewModel.swift
//  Tamagotchi
//
//  Created by Mees Rootjes on 30/03/2022.
//

import UIKit

final class CharacterViewModel: ObservableObject{
    
    func getEggViewImage(number: Int) -> String{
        var egg = ""
        
        switch number{
        case 0:
            egg = "eggImageOne"
            break
        case 1:
            egg = "eggImageTwo"
            break
        case 2:
            egg = "eggImageThird"
            break
        case 3:
            egg = "eggImageFour"
            break
        case 4:
            egg = "eggImageFifth"
            break
        case 5:
            egg = "eggImageSix"
            break
        case 6:
            egg = "eggImageSeven"
            break
            
        default:
            egg = ""
        }
        
        return egg
    }
}
