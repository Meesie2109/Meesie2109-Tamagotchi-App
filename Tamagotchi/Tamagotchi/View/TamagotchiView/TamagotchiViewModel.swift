//
//  TamagotchiViewModel.swift
//  Tamagotchi
//
//  Created by Mees Rootjes on 30/03/2022.
//

import UIKit

final class TamagotchiViewModel: ObservableObject{
    
    public func getTamagotchiViewImage(number: Int) -> String{
        var tamagotchiImage = "tamagotchi"
//        var randumNumber = Int.random(in: 0...2)
//
//        if(number == 0){
//
//            switch randumNumber{
//
//                case 0:
//                    tamagotchiImage = ""
//                    break
//                case 1:
//                    tamagotchiImage = ""
//                    break
//                case 2:
//                    tamagotchiImage = ""
//                    break
//
//            default:
//                tamagotchiImage = ""
//            }
//        }
        
        return tamagotchiImage
    }
}
