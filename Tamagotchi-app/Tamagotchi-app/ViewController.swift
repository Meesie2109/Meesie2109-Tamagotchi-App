//
//  ViewController.swift
//  Tamagotchi-app
//
//  Created by Mees Rootjes on 09/03/2022.
//

import UIKit

class ViewController: UIViewController {
    var timer = Timer()
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
                width: 150,
                height: 150
            )
        )
        characterView.center = view.center
        
        GestureRecognizer(viewInstance: characterView)
        
        //Calls the timerSubView from a viewFile
        let timerView = TimerView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: 50,
                height: 50
            )
        )
        
        countDown()
        
        //Adds the subviews to the main view
        view.addSubview(characterView)
        view.addSubview(timerView)
    }
    
    //MARK: - Gesture Recognizer
    
    //A function to tell if the user taps on the screen
    private func GestureRecognizer(viewInstance: UIView) {
        
        let gestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(gestureFired(_:)))

        //Amount of taps required
        gestureRecognizer.numberOfTapsRequired = 1
        gestureRecognizer.numberOfTouchesRequired = 1
        
//        let gestureRecognizer =  UISwipeGestureRecognizer(target: self, action:
//        #selector(gestureFired(_:)))
//        gestureRecognizer.direction = .right
//        gestureRecognizer.numberOfTouchesRequired = 1
        
        //Adds the GestureRecognizer to the view
        viewInstance.addGestureRecognizer(gestureRecognizer)
        viewInstance.isUserInteractionEnabled = true
    }
    
    @objc private func gestureFired(_ gesture: UITapGestureRecognizer){
        if let firedView = gesture.view {
            firedView.backgroundColor = .black
        }
    }
    
    //MARK: - Count Down / Timer
    
    //A function that counts down and then executes a function
    func countDown(){
        var timeLeft = 10
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            print("timer fired!")
            timeLeft -= 1
            print(timeLeft)
                        
            if(timeLeft==0){
                timer.invalidate()
            }
        }
    }
    
    
}

