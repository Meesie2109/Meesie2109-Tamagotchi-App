//
//  ViewController.swift
//  Tamagotchi-app
//
//  Created by Mees Rootjes on 09/03/2022.
//

import UIKit
import AVKit

var player: AVPlayer!


class ViewController: UIViewController {
    
    var timer = Timer()
    var character = Character.init(name: "", gender: "", health: 100, food: 100 , sleep: 100, attention: 100, status: "InEgg")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.


    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    //Override function to add new subviews to the main view
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        loadBackground()
        
        //MARK: - Initialization of the healthTimerView
        
        //Calls the foodTimerView from a viewFile
        let healthTimerView = TimerView(
            frame: CGRect(
                x: 260.0,
                y: 40.0,
                width: 50.0,
                height: 50.0
            )
        )
        healthTimerView.configure(with: 1, with: 5.0, with: 5.0)
        
        //MARK: - End of initialization of the healthTimerView
        
        
        
        //MARK: - Initialization of the foodProgressView
        
        //Calls the CircularProgressSubView from a viewFile
        let healthProgressView = CircularProgressView(
            frame: CGRect(
                x: 265.0,
                y: 45.0,
                width: 40.0,
                height: 40.0
            )
        )
        healthProgressView .trackColor =
            UIColor(
                red: 16.0/255.0,
                green: 52.0/255.0,
                blue: 173.0/255.0,
                alpha: 1.0
            )
        healthProgressView .progressColor = UIColor.green
        healthProgressView .tag = 101
        healthProgressView .layer.zPosition = 10;
        
        //Calls a methode to animate the progressBar
        self.perform(#selector(animateProgress), with: nil, afterDelay: 2.0)
        
        //MARK: - End of initialization of the foodProgressView
        
        
        
        //MARK: - Initialization of the foodTimerView
        
        //Calls the attentionTimerView from a viewFile
        let foodTimerView = TimerView(
            frame: CGRect(
                x: 260.0,
                y: 150.0,
                width: 50.0,
                height: 50.0
            )
        )
        foodTimerView.configure(with: 1, with: 5.0, with: 5.0)
        
        //MARK: - End of initialization of the foodTimerView
        
        
        
        //MARK: - Initialization of the foodProgressView
        
        //Calls the CircularProgressSubView from a viewFile
        let foodProgressView = CircularProgressView(
            frame: CGRect(
                x: 265.0,
                y: 155.0,
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
        
        
        
        //MARK: - Initialization of the attentionTimerView
        
        //Calls the attentionTimerView from a viewFile
        let attentionTimerView = TimerView(
            frame: CGRect(
                x: 260.0,
                y: 95.0,
                width: 50.0,
                height: 50.0
            )
        )
        attentionTimerView.configure(with: 1, with: 5.0, with: 5.0)
        
        //MARK: - End of initialization of the attentionTimerView
        
        
        
        //MARK: - Initialization of the attentionProgressView
        
        //Calls the CircularProgressSubView from a viewFile
        let attentionProgressView = CircularProgressView(
            frame: CGRect(
                x: 265.0,
                y: 100.0,
                width: 40.0,
                height: 40.0
            )
        )
        attentionProgressView .trackColor =
            UIColor(
                red: 16.0/255.0,
                green: 52.0/255.0,
                blue: 173.0/255.0,
                alpha: 1.0
            )
        attentionProgressView .progressColor = UIColor.green
        attentionProgressView .tag = 101
        attentionProgressView .layer.zPosition = 10;
        
        //Calls a methode to animate the progressBar
        self.perform(#selector(animateProgress), with: nil, afterDelay: 2.0)
        
        //MARK: - End of initialization of the attentionProgressView
        
        
        
        //MARK: - Initialization of the timerView
        
        //Calls the timerSubView from a viewFile
        let timerView = TimerView(
            frame: CGRect(
                x: 10,
                y: 40,
                width: 50,
                height: 50
            )
        )
        
        //MARK: - End of initialization of the Timerview
        
        
        
        //MARK: - Initialization of the characterView
        
        //Calls the characterSubView from a viewFile
        let characterView = UIImageView(
            frame: CGRect(
                x: 0,
                y: 200,
                width: 200,
                height: 200
            )
        )
        characterView.center = view.center
//        characterView.image = UIImage(named: "redEgg")
        
        //Call to a cesturereconiger to register touches on the object
        GestureRecognizer(viewInstance: characterView)
        
        //MARK: - End of initialization of the characterView
        
        
        
        //MARK: - Initialization of the timerProgressView
        
        //Calls the timerProgressView from a viewFile
        let timerProgressView = CircularProgressView(
            frame: CGRect(
                x: 15.0,
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
        
        if(self.character.status == "Alive"){

            
            self.view.addSubview(timerView)
            self.view.addSubview(timerProgressView)
            self.view.addSubview(healthTimerView)
            self.view.addSubview(healthProgressView)
            self.view.addSubview(attentionTimerView)
            self.view.addSubview(attentionProgressView)
            self.view.addSubview(foodTimerView)
            self.view.addSubview(foodProgressView)
        }
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
            
            //Amount withdrawn every second
            timeLeft -= 1
            progress += 0.01
            
            //Gives the number to the view so it can be added to the label
            timerView.configure(with: timeLeft, with: 5.0, with: 5.0)
            timerProgressView.configure(with: progress)
            
            let healthProgressPercentage = self.character.health / 100
            healthProgressView.configure(with: healthProgressPercentage)
            
            let attentionProgressPercentage = self.character.attention / 100
            attentionProgressView.configure(with: attentionProgressPercentage)
            
            let foodProgressPercentage = self.character.food / 100
            foodProgressView.configure(with: foodProgressPercentage)
            
            if(self.character.status == "InEgg"){
                
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
                    
                    //Check of food is 0 and when it is withdraws health until 0
                    if(self.character.food <= 0 || self.character.attention <= 0){
                        if(self.character.health <= 0){
                            self.character.status = "Deceased"
                        } else {
                            if(self.character.food <= 0){
                                self.character.health = self.character.health - 25
                            }
                            if(self.character.attention <= 0){
                                self.character.health = self.character.health - 10
                            }
                        }
                    }
                    
                    //Withdrawds attention every time to timer stands on 0
                    if(self.character.attention >= 0){
                        self.character.attention = self.character.attention - 15
                    }
                    
                    //calls a switch statment that changed the color of the progressView
                    switchProgress(progressView: healthProgressView, selfCharacter: Int(self.character.health))
                    
                    //calls a switch statment that changed the color of the progressView
                    switchProgress(progressView: attentionProgressView, selfCharacter: Int(self.character.attention))
                    
                    //calls a switch statment that changed the color of the progressView
                    switchProgress(progressView: foodProgressView, selfCharacter: Int(self.character.food))
                    
                    //Only for development porpuse
                    print(character)
                }
            }
        }
        
        //MARK: - End of Timer / Countdown
        
        //Adds the subviews to the main view
        self.view.addSubview(characterView)
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
    
    //gesture recognizer that changes the character status
    @objc private func gestureFired(_ gesture: UITapGestureRecognizer){
        if let firedView = gesture.view {
            if(self.character.status == "InEgg"){
                self.character.status = "BrokenEgg"
                print("Broken")
                viewDidLayoutSubviews()
            } else {
//                firedView.backgroundColor = .yellow
                print("Alive")
                self.character.status = "Alive"
                viewDidLayoutSubviews()
            }
        }
    }
    
    //Function to animate the CircularProgressView/Bar
    @objc func animateProgress() {
        if(self.character.status == "Alive"){
            let cP = self.view.viewWithTag(101) as! CircularProgressView
            cP.setProgressWithAnimation(duration: 1.0, value: 0.0)
        }
    }
    
    //Function to overwrite memory warnings
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Swicth statment for progressView
    
    //Switch statment that changes the color of the progressViews that call it
    func switchProgress(progressView: CircularProgressView, selfCharacter: Int){
        switch selfCharacter{
            case 50...75:
                progressView.progressColor = UIColor(red: 33.0/255.0, green: 161.0/255.0, blue: 21.0/255.0, alpha: 1.0)
                break
            case  25...50:
                progressView.progressColor = UIColor.yellow
                break
            case 10...25:
                progressView.progressColor = UIColor.orange
                break
            case 0...10:
                progressView.progressColor = UIColor.red
                break
            default:
                break
        }
    }
    
    
    //Function to load the background of the app
    func loadBackground() {
        //Initialization of the BackgroundImage
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
        
        //Initialization of the BackgroundVidoe
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "yellowEggHatching", ofType: "mp4")!))
        let vidoeLayer = AVPlayerLayer(player: player)
        vidoeLayer.frame = view.bounds
        vidoeLayer.videoGravity = .resizeAspectFill

        
        player.volume = 0
        player.isMuted = true
        vidoeLayer.isHidden = true
        
        //Sets the name of the vidoePlayer
        vidoeLayer.name = "vidoeLayer"
        
        //Ecexutes when character status is BrokenEgg
        if(self.character.status == "BrokenEgg"){
            view.layer.addSublayer(vidoeLayer)
            vidoeLayer.isHidden = false
            player.play()
            
        }
        
        //Ecexutes when character status is Alive
        if(self.character.status == "Alive"){
            vidoeLayer.isHidden = true
            self.view.layer.sublayers?
                .filter{$0.name == "vidoeLayer"}
                .forEach { $0.removeFromSuperlayer() }
            vidoeLayer.isHidden = true
            
            view.insertSubview(backgroundImage, at: 0)
        }
    }
    
    //MARK: - End of Swicth statment for progressView
}

