//
//  ViewController.swift
//  TamagotchiApp
//
//  Created by Mees Rootjes on 27/03/2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var tamagotchi = tamagotchiData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //MARK: - Delecrations of SubViews
        
        view.addSubview(BackgroundView())
        
        
        UserDefaults.standard.set(100, forKey: "money")
        print(tamagotchi)
    }


}

