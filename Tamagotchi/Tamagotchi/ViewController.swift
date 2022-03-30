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
    var isTrue = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapToStartView = TapToStartView()
        tapToStartView.frame = CGRect(x: 0, y: 70, width: 400, height: 400)
        tapToStartView.backgroundColor = .red
        tapToStartView.tag = 1
        GestureRecognizer(ViewInstance: tapToStartView)
        
        if(Tamagotchi.status == ""){
            view.addSubview(BackgroundView())
            view.addSubview(tapToStartView)
        }
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
        print("The egg has landend")
        
        if(Tamagotchi.status == "InEgg"){
            if(isTrue == 1){
                RandomNumber = Int.random(in: 0...6)
                isTrue = 0
            }
            if let viewWithTag = self.view.viewWithTag(1){
                viewWithTag.removeFromSuperview()
            }
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
        print("The egg has broken")
        if(Tamagotchi.status == "Alive"){
            if let viewWithTag = self.view.viewWithTag(2){
                viewWithTag.removeFromSuperview()
            }
                print("I am alive")
                let tamagotchiView = TamagotchiView()
                tamagotchiView.tag = 3
                tamagotchiView.configure(number: RandomNumber)
                view.addSubview(tamagotchiView)
                
                var time = 10
                
                var timerTest: Timer? = nil
                guard timerTest == nil else { return }
                timerTest = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
                    print(time)
                    time -= 1
                    if(time == 0){
                        isTrue = 1
                        Tamagotchi.status = ""
                        if let viewWithTag = self.view.viewWithTag(1){
                            viewWithTag.removeFromSuperview()
                        }
                        viewDidLoad()
                        timerTest?.invalidate()
                        timerTest = nil
                    }
            }
        }
    }
    
    //MARK: - End of the Character Gesture Recognizer
    
    public func setTamagotchi(){
        if(Tamagotchi.status == "Alive"){
            if let viewWithTag = self.view.viewWithTag(2){
                viewWithTag.removeFromSuperview()
            }
            if(isTrue == 2){
                print("I am alive")
                let tamagotchiView = TamagotchiView()
                tamagotchiView.tag = 3
                tamagotchiView.configure(number: RandomNumber)
                view.addSubview(tamagotchiView)
                
                var time = 10
                
                var timerTest: Timer? = nil
                guard timerTest == nil else { return }
                timerTest = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
                    print(time)
                    time -= 1
                    if(time == 0){
                        isTrue = 1
                        Tamagotchi.status = ""
                        if let viewWithTag = self.view.viewWithTag(1){
                            viewWithTag.removeFromSuperview()
                        }
                        view.subviews.forEach { $0.removeFromSuperview() }
                        viewDidLayoutSubviews()
                        timerTest?.invalidate()
                        timerTest = nil
                    }
                }
            }
        }
    }
}

