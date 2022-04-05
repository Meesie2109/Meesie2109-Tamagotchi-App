//
//  ViewController.swift
//  Tamagotchi
//
//  Created by Mees Rootjes on 29/03/2022.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    var RandomNumber = -99

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Tamagotchi.tamagotchis)
        
        let CollectionButton = UIButton()
        CollectionButton.setTitle("Collection", for: .normal)
        CollectionButton.frame = CGRect(x: 6, y: 460, width: 150, height: 100)
        CollectionButton.backgroundColor = UIColor(red: 230.0/255.0, green: 177.0/255.0, blue: 92.0/255.0, alpha: 1.0)
        CollectionButton.tag = 4
        CollectionButton.layer.cornerRadius = 15
        CollectionButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
        CollectionButton.layer.borderWidth = 2
        CollectionButton.layer.borderColor = UIColor.black.cgColor
        CollectionButton.addTarget(self, action: #selector(ButtonTapped), for: .touchUpInside)
        
        let button = UIButton()
        button.setTitle("Credits", for: .normal)
        button.frame = CGRect(x: 165, y: 460, width: 150, height: 100)
        button.backgroundColor = UIColor(red: 230.0/255.0, green: 177.0/255.0, blue: 92.0/255.0, alpha: 1.0)
        button.tag = 5
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(ButtonTapped), for: .touchUpInside)
        
        let tapToStartView = TapToStartView()
        tapToStartView.frame = CGRect(x: 0, y: 70, width: 400, height: 400)
        tapToStartView.tag = 1
        GestureRecognizer(ViewInstance: tapToStartView)
        
        if(Tamagotchi.status == ""){
            view.addSubview(BackgroundView())
            view.addSubview(CollectionButton)
            view.addSubview(button)
            view.addSubview(tapToStartView)
        }
    }
    
    @objc func ButtonTapped(){
        
        if let viewWithTag = self.view.viewWithTag(1){
            viewWithTag.removeFromSuperview()
        }
        
        if let viewWithTag = self.view.viewWithTag(4){
            viewWithTag.removeFromSuperview()
        }
        
        if let viewWithTag = self.view.viewWithTag(5){
            viewWithTag.removeFromSuperview()
        }
        
        view.addSubview(CollectionView())
        view.addSubview(ClosedButton)
    }
    
    //MARK: - Gesture Recognizer
    
    public func GestureRecognizer(ViewInstance: UIView){
        
        let gestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(GestureFired(_:))
        )
        gestureRecognizer.numberOfTapsRequired = 1
        ViewInstance.isUserInteractionEnabled = true
        ViewInstance.addGestureRecognizer(gestureRecognizer)
        
    }
    
    @objc public func GestureFired(_ gesture: UITapGestureRecognizer){
        Tamagotchi.status = "InEgg"
        
        if(Tamagotchi.status == "InEgg"){
            
            //Removes the tapToStartView from the ViewStack.
            if let viewWithTag = self.view.viewWithTag(1){
                viewWithTag.removeFromSuperview()
            }
            
            if let viewWithTag = self.view.viewWithTag(4){
                viewWithTag.removeFromSuperview()
            }
            
            if let viewWithTag = self.view.viewWithTag(5){
                viewWithTag.removeFromSuperview()
            }
            
            //Adds a randum number to define which egg is gonna show up.
            RandomNumber = Int.random(in: 0...6)
            
            
            let character = CharacterView()
            character.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
            character.configure(number: RandomNumber)
            character.tag = 2
            
            view.addSubview(character)
            CharacterGesture(view: character)
        }
    }
    
    //MARK: - End of the Gesture Recognizer
    
    
    
    //MARK: - Character Gesture Recognizer
    
    public func CharacterGesture(view: UIView){
        let characterGesture = UITapGestureRecognizer(
            target: self, action: #selector(CharacterGestureFired(_:))
        )
        characterGesture.numberOfTapsRequired = 10
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(characterGesture)
    }
    
    @objc public func CharacterGestureFired(_ gesture: UIGestureRecognizer){
        Tamagotchi.status = "Alive"
        
        if(Tamagotchi.status == "Alive"){
            
            //Removes the CharacterView from the ViewStack.
            if let viewWithTag = self.view.viewWithTag(2){
                viewWithTag.removeFromSuperview()
            }
            
            let tamagotchiView = TamagotchiView()
            tamagotchiView.tag = 3
            tamagotchiView.configure(number: RandomNumber)
            
            //Adds the TamagotchiView to the ViewStack
            view.addSubview(tamagotchiView)
            
            foodButton.addTarget(self, action: #selector(foodButtonTapped), for: .touchUpInside)
            foodButton.tag = 7
            view.addSubview(foodButton)
            
            attentionButton.addTarget(self, action: #selector(attentionButtonTapped), for: .touchUpInside)
            attentionButton.tag = 8
            view.addSubview(attentionButton)
            
            let tamagotchiStatsView = TamagotchiStatsView()
            tamagotchiStatsView.tag = 6
            let health = Tamagotchi.health / 100
            let attention = Tamagotchi.attention / 100
            let food = Tamagotchi.food / 100
            tamagotchiStatsView.configure(Progress: health, attentionProgress: attention, foodProgess: food)
            
            //Adds the TamagotchiStatsView to the ViewStack
            view.addSubview(tamagotchiStatsView)
                
            var timerTest: Timer? = nil
            guard timerTest == nil else { return }
            timerTest = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in

                if(Tamagotchi.attention <= 0){
                    Tamagotchi.health -= 0.1
                }
                if(Tamagotchi.food <= 0){
                    Tamagotchi.health -= 0.1
                }
                Tamagotchi.attention -= 0.3
                Tamagotchi.food -= 0.2
                
                if let viewWithTag = self.view.viewWithTag(6){
                    viewWithTag.removeFromSuperview()
                }
                
                let health = Tamagotchi.health / 100
                let attention = Tamagotchi.attention / 100
                let food = Tamagotchi.food / 100
                
                tamagotchiStatsView.configure(Progress: health, attentionProgress: attention, foodProgess: food)
                view.addSubview(tamagotchiStatsView)
                
                if(Tamagotchi.health <= 0){
                    
                    Tamagotchi.status = ""
                    Tamagotchi.health = 100
                    Tamagotchi.attention = 100
                    Tamagotchi.food = 100
                    
                    if let viewWithTag = self.view.viewWithTag(7){
                        viewWithTag.removeFromSuperview()
                    }
                    if let viewWithTag = self.view.viewWithTag(8){
                        viewWithTag.removeFromSuperview()
                    }
                    
                    //Calls the viewDidLoad() to rerun the app again
                    viewDidLoad()
                    
                    //Code to stop the timer
                    timerTest?.invalidate()
                    timerTest = nil
                }
            }
        }
    }
    
    //MARK: - End of the Character Gesture Recognizer
    @objc public func foodButtonTapped(){
        if(Tamagotchi.food < 90){
            Tamagotchi.food += 10
        } else {
            Tamagotchi.food = 100
        }
    }
    
    @objc public func attentionButtonTapped(){
        if(Tamagotchi.attention < 90){
            Tamagotchi.attention += 10
        } else {
            Tamagotchi.attention = 100
        }
    }
    
    let foodButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Food", for: .normal)
        button.frame = CGRect(x:175, y: 515, width: 130, height: 80)
        button.backgroundColor = UIColor(red: 230.0/255.0, green: 177.0/255.0, blue: 92.0/255.0, alpha: 1.0)
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        
        return button
    }()
    
    let attentionButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Attention", for: .normal)
        button.frame = CGRect(x:15, y: 515, width: 130, height: 80)
        button.backgroundColor = UIColor(red: 230.0/255.0, green: 177.0/255.0, blue: 92.0/255.0, alpha: 1.0)
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        
        return button
    }()
    
    let ClosedButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("X", for: .normal)
        button.frame = CGRect(x:285, y: 55, width: 30, height: 30)
        button.backgroundColor = .red
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(CloseButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc func CloseButton(){
        viewDidLoad()
    }

}
