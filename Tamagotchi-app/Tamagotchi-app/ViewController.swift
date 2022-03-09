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
    
    //Override function to add new subviews to the main view
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //Calls the characterSubView from a viewFile
        let characterView = CharacterView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: 100,
                height: 100
            )
        )
        characterView.center = view.center
        
        //Calls the timerSubView from a viewFile
        let timerView = TimerView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: 50,
                height: 50
            )
        )
        
        //Adds the subviews to the main view
        view.addSubview(characterView)
        view.addSubview(timerView)
    }
    
    


}

