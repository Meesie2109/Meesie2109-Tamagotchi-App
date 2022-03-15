//
//  ViewController.swift
//  Tamagotchi-app
//
//  Created by Mees Rootjes on 09/03/2022.
//

import UIKit

class ViewController: UIViewController {
    var timer = Timer()
    var character = Character.init(name: "", gender: "", health: 100, food: 100 , sleep: 100, attention: 100, status: "InEgg")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Override function to add new subviews to the main view
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //Calls the timerSubView from a viewFile
        let timerView = TimerView(
            frame: CGRect(
                x: 20,
                y: 40,
                width: 50,
                height: 50
            )
        )
        
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
        
        //Calls the CircularProgressSubView from a viewFile
        let circularProgress = CircularProgressView(
            frame: CGRect(
                x: 25.0,
                y: 45.0,
                width: 40.0,
                height: 40.0
            )
        )
        
        //Colors used for the progressBar
        circularProgress.trackColor = UIColor(red: 16.0/255.0, green: 52.0/255.0, blue: 173.0/255.0, alpha: 1.0)
        circularProgress.progressColor = UIColor.green
        
        circularProgress.tag = 101
        self.perform(#selector(animateProgress), with: nil, afterDelay: 2.0)
        circularProgress.layer.zPosition = 10;
        
        //MARK: - Timer / CountDown
        
        //Amount of second the timer is gonna count from
        var timeLeft = 100
        //Startpoint for the progressbar in the timer
        var progress = 0.0
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
            
            //Amount withdrawn every second
            timeLeft -= 1
            progress += 0.01
            
            //Gives the number to the view so it can be added to the label
            timerView.configure(with: timeLeft)
            circularProgress.configure(with: progress)
            
            if(self.character.status == "InEgg"){
                if(timeLeft == 0){
                    print("I am still in the egg")
                    timeLeft = 100
                }
            } else {
                //Checks if the timer has 0 seconds left
                if(timeLeft == 0){
                    timeLeft = 100
                    progress = 0
                    self.character.food = self.character.food - 10
                    if(self.character.food <= 0){
                        if(self.character.health <= 0){
                            self.character.status = "Deceased"
                        } else {
                            self.character.health = self.character.health - 25
                        }
                    }
                    self.character.attention = self.character.attention - 15
                    print(character)
                }
            }
        }
        
        //Adds the subviews to the main view
        self.view.addSubview(characterView)
        self.view.addSubview(timerView)
        self.view.addSubview(circularProgress)
    }
    
    //MARK: - Gesture Recognizer
    
    //A function to tell if the user taps on the screen
    private func GestureRecognizer(viewInstance: UIView) {
        
        let gestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(gestureFired(_:)))
        
        //Amount of taps required
        gestureRecognizer.numberOfTapsRequired = 10
        gestureRecognizer.numberOfTouchesRequired = 1
        
        let secondGestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(gestureFired(_:)))
        
        //Amount of tabs required
        secondGestureRecognizer.numberOfTapsRequired = 20
        secondGestureRecognizer.numberOfTouchesRequired = 1
        
//        let gestureRecognizer =  UISwipeGestureRecognizer(target: self, action:
//        #selector(gestureFired(_:)))
//        gestureRecognizer.direction = .right
//        gestureRecognizer.numberOfTouchesRequired = 1
        
        //Adds the GestureRecognizer to the view
        viewInstance.addGestureRecognizer(gestureRecognizer)
        viewInstance.addGestureRecognizer(secondGestureRecognizer)
        viewInstance.isUserInteractionEnabled = true
    }
    
    @objc private func gestureFired(_ gesture: UITapGestureRecognizer){
        if let firedView = gesture.view {
            if(self.character.status == "InEgg"){
                firedView.backgroundColor = .black
                self.character.status = "BrokenEgg"
            } else {
                firedView.backgroundColor = .yellow
                self.character.status = "Alive"
            }
        }
    }
    
    //Function to animate the CircularProgressView/Bar
    @objc func animateProgress() {
        let cP = self.view.viewWithTag(101) as! CircularProgressView
        cP.setProgressWithAnimation(duration: 1.0, value: 0.0)
    }
    
    //Function to overwrite memory warnings
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

