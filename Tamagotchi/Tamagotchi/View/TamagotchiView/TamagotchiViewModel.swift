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
            tamagotchiImage = getImage(randomNumber: randomNumber, imageOne: "tamagotchiOne", imageTwo: "tamagotchiTwo")
        } else if(number == 1){
            tamagotchiImage = getImage(randomNumber: randomNumber, imageOne: "tamagotchiThree", imageTwo: "tamagotchiFour")
        }
        else if(number == 2){
            tamagotchiImage = getImage(randomNumber: randomNumber, imageOne: "tamagotchiFive", imageTwo: "tamagotchiSix")
        }
        else if(number == 3){
            tamagotchiImage = getImage(randomNumber: randomNumber, imageOne: "tamagotchiSeven", imageTwo: "tamagotchiEight")
        }
        else if(number == 4){
            tamagotchiImage = getImage(randomNumber: randomNumber, imageOne: "tamagotchiNine", imageTwo: "tamagotchiTen")
        }
        else if(number == 5){
            tamagotchiImage = getImage(randomNumber: randomNumber, imageOne: "tamagotchiEleven", imageTwo: "tamagotchiTwelve")
        }
        else if(number == 6){
            tamagotchiImage = getImage(randomNumber: randomNumber, imageOne: "tamagotchiThirteen", imageTwo: "tamagotchiFourteen")
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
