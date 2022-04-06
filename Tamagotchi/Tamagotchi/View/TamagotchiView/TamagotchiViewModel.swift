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
        let randomNumber = Int.random(in: 0...1)

        if(number == 0){
            tamagotchiImage = getImage(randomNumber: randomNumber, imageOne: "tamagotchiOneHappy", imageTwo: "tamagotchiTwo")
            Tamagotchi.tamagotchis += ["1"]

        } else if(number == 1){
            tamagotchiImage = getImage(randomNumber: randomNumber, imageOne: "tamagotchiThree", imageTwo: "tamagotchiFour")
            Tamagotchi.tamagotchis += ["2"]
        }
        else if(number == 2){
            tamagotchiImage = getImage(randomNumber: randomNumber, imageOne: "tamagotchiFive", imageTwo: "tamagotchiSix")
            Tamagotchi.tamagotchis += ["3"]
        }
        else if(number == 3){
            tamagotchiImage = getImage(randomNumber: randomNumber, imageOne: "tamagotchiSeven", imageTwo: "tamagotchiEight")
            Tamagotchi.tamagotchis += ["4"]
        }
        else if(number == 4){
            tamagotchiImage = getImage(randomNumber: randomNumber, imageOne: "tamagotchiNine", imageTwo: "tamagotchiTen")
            Tamagotchi.tamagotchis += ["5"]
        }
        else if(number == 5){
            tamagotchiImage = getImage(randomNumber: randomNumber, imageOne: "tamagotchiEleven", imageTwo: "tamagotchiTwelve")
            Tamagotchi.tamagotchis += ["6"]
        }
        else if(number == 6){
            tamagotchiImage = getImage(randomNumber: randomNumber, imageOne: "tamagotchiThirteen", imageTwo: "tamagotchiFourteen")
            Tamagotchi.tamagotchis += ["7"]
        }
        
        return tamagotchiImage
    }
    
    public func getImage(randomNumber: Int, imageOne: String, imageTwo:String) -> String{
        var image = ""
        
        switch randomNumber{

            case 0:
                image = imageOne
                break
            case 1:
                image = imageTwo
                break

        default:
            image = ""
        }
        
        return image
    }
}
