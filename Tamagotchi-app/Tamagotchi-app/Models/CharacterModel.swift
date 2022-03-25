//
//  CharacterModel.swift
//  Tamagotchi-app
//
//  Created by Mees Rootjes on 09/03/2022.
//

import Foundation

//MARK: - Character Model

//Decleartion of the model called "Character" to be used
//in instances true out the app

struct Character {
    let name: String
    let gender: String
    var health: Double
    var food: Double
    var sleep: Double
    var attention: Double
    var status: String
    var bread: Int
}
