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
        
        //MARK: - Initialization of the foodTimerView
        
        //Calls the foodTimerView from a viewFile
        let foodTimerView = TimerView(
            frame: CGRect(
                x: 245,
                y: 40,
                width: 50,
                height: 50
            )
        )
        foodTimerView.configure(with: 1, with: 5.0, with: 5.0)
        
        //MARK: - End of initialization of the foodTimerView
        
        
        
        //MARK: - Initialization of the foodProgressView
        
        //Calls the CircularProgressSubView from a viewFile
        let foodProgressView = CircularProgressView(
            frame: CGRect(
                x: 250.0,
                y: 45.0,
                width: 40.0,
                height: 40.0
            )
        )
        foodProgressView .trackColor =
            UIColor(
                red: 16.0/255.0,
                green: 52.0/255.0,
                blue: 173.0/255.0,
                alpha: 1.0
            )
        foodProgressView .progressColor = UIColor.green
        foodProgressView .tag = 101
        foodProgressView .layer.zPosition = 10;
        
        //Calls a methode to animate the progressBar
        self.perform(#selector(animateProgress), with: nil, afterDelay: 2.0)
        
        //MARK: - End of initialization of the foodProgressView
        
        
        
        //MARK: - Initialization of the timerView
        
        //Calls the timerSubView from a viewFile
        let timerView = TimerView(
            frame: CGRect(
                x: 20,
                y: 40,
                width: 50,
                height: 50
            )
        )
        
        //MARK: - End of initialization of the Timerview
        
        
        
        //MARK: - Initialization of the characterView
        
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
        
        //Call to a cesturereconiger to register touches on the object
        GestureRecognizer(viewInstance: characterView)
        
        //MARK: - End of initialization of the characterView
        
        
        
        //MARK: - Initialization of the timerProgressView
        
        //Calls the timerProgressView from a viewFile
        let timerProgressView = CircularProgressView(
            frame: CGRect(
                x: 25.0,
                y: 45.0,
                width: 40.0,
                height: 40.0
            )
        )
        timerProgressView.trackColor =
            UIColor(
                red: 16.0/255.0,
                green: 52.0/255.0,
                blue: 173.0/255.0,
                alpha: 1.0
            )
        timerProgressView.progressColor = UIColor.green
        timerProgressView.tag = 101
        timerProgressView.layer.zPosition = 10;
        
        //Calls a methode to animate the progressBar
        self.perform(#selector(animateProgress), with: nil, afterDelay: 2.0)
        
        //MARK: - End of initialization of the timerProgressView
        
        
        
        //MARK: - Timer / CountDown
        
        //Initialization of numbers that are used multiple times in the timer
        let timeInitialization = 100
        let progressInitialization = 0.0
        
        //Amount of second the timer is gonna count from
        var timeLeft = timeInitialization
        
        //Startpoint for the progressbar in the timer
        var progress = progressInitialization
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
            
            //Amount withdrawn every second
            timeLeft -= 1
            progress += 0.01
            
            //Gives the number to the view so it can be added to the label
            timerView.configure(with: timeLeft, with: 5.0, with: 5.0)
            timerProgressView.configure(with: progress)
            let foodProgressPercentage = self.character.food / 100
            foodProgressView.configure(with: foodProgressPercentage)
            
            
            if(self.character.status == "InEgg"){
                if(timeLeft == 0){
                    print("I am still in the egg")
                    timeLeft = timeInitialization
                    progress = progressInitialization
                }
            } else {
                //Checks if the timer has 0 seconds left
                if(timeLeft == 0){
                    
                    //Resets the timer and the progressBar of the timer
                    timeLeft = timeInitialization
                    progress = progressInitialization
                    
                    //Withdrawds food every time to timer stands on 0
                    if(self.character.food >= 0){
                        self.character.food = self.character.food - 10
                    }
                    
                    //Swith statment to check how much food is left
                    switch self.character.food{
                        case 50...75:
                            foodProgressView.progressColor = UIColor.darkGray
                            break
                        case  25...50:
                            foodProgressView.progressColor = UIColor.red
                            break
                        case 10...25:
                            foodProgressView.progressColor = UIColor.orange
                            break
                        case 0...10:
                            foodProgressView.progressColor = UIColor.red
                            break
                        default:
                            break
                    }
                    
                    //Withdrawds attention every time to timer stands on 0
                    if(self.character.attention >= 0){
                        self.character.attention = self.character.attention - 15
                    }
                    
                    //Check of food is 0 and when it is withdraws health until 0
                    if(self.character.food <= 0){
                        if(self.character.health <= 0){
                            self.character.status = "Deceased"
                        } else {
                            self.character.health = self.character.health - 25
                        }
                    }
                    
                    //Only for development porpuse
                    print(character)
                }
            }
        }
        
        //Adds the subviews to the main view
        self.view.addSubview(characterView)
        self.view.addSubview(timerView)
        self.view.addSubview(timerProgressView)
        self.view.addSubview(foodTimerView)
        self.view.addSubview(foodProgressView )
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

