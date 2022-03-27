//
//  ViewController.swift
//  TamagotchiApp
//
//  Created by Mees Rootjes on 27/03/2022.
//

import UIKit

class ViewController: UIViewController {
    
    var tamagotchi = Tamagotchi(collected: ["Hello", "World"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print(tamagotchi.collected)
    }


}

