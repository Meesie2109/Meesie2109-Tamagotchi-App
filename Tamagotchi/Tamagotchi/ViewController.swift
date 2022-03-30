//
//  ViewController.swift
//  Tamagotchi
//
//  Created by Mees Rootjes on 29/03/2022.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    let RandomNumber = Int.random(in: 0...2)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let tapToStartView = TapToStartView()
        tapToStartView.frame = CGRect(x: 0, y: 70, width: 400, height: 400)
        tapToStartView.backgroundColor = .red
        tapToStartView.tag = 1
        GestureRecognizer(ViewInstance: tapToStartView)
        
        if(Tamagotchi.status == ""){
            view.addSubview(BackgroundView())
            view.addSubview(tapToStartView)
        }
        
        if(Tamagotchi.status == "InEgg"){
            if let viewWithTag = self.view.viewWithTag(1){
                viewWithTag.removeFromSuperview()
            }
            let character = CharacterView()
            character.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
            character.tag = 2
            view.addSubview(character)
            CharacterGesture(view: character)
        }
        
        let _: AVPlayer!
        
        if(Tamagotchi.status == "BrokenEgg"){
            if let viewWithTag = self.view.viewWithTag(2){
                viewWithTag.removeFromSuperview()
            }
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
        viewDidLayoutSubviews()
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
        Tamagotchi.status = "BrokenEgg"
        print("The egg has broken")
        viewDidLayoutSubviews()
    }
    
    //MARK: - End of the Character Gesture Recognizer
}

