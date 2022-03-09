//
//  ViewController.swift
//  Tamagotchi-app
//
//  Created by Mees Rootjes on 09/03/2022.
//

import UIKit

class ViewController: UIViewController {
    
    var character = Character.init(name: "", gender: "", health: 100, food: 100, attention: 100, status: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        character.food = 200
        print(character.food)
    }
    
    


}

