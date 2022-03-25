//
//  ViewController.swift
//  Tamagotchi-app
//
//  Created by Mees Rootjes on 09/03/2022.
//

import UIKit
import AVKit

var player: AVPlayer!


class ViewController: helperFunctions {
    
    var timer = Timer()
    var character = Character.init(name: "", gender: "", health: 500, food: 100 , sleep: 100, attention: 100, status: "InEgg", bread: Int.random(in: 0...2))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //Initialization of the BackgroundImage
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
        print(self.character.bread)
        
        //Calls a function to get a UIView from the HelpersFunction class
        let characterEggView = getCharacterEggView(number: self.character.bread)
        characterEggView.tag = 156
        
        //Calls a function to get a UIView from the viewgetter class
        let characterPichuView = getCharacterPichuView(number: self.character.bread)
        characterPichuView.tag = 126
        
        let gestureView = getGestureView()
        
        //Calls a function with a GestureRecognizer in it
        GestureRecognizer(viewInstance: gestureView)
        
        //Calls a function to change the character on the status of the app
        changeCharacter(characterEggView: characterEggView, characterPichuView: characterPichuView)
        self.view.addSubview(gestureView)
        
        //Calls a function to get a UIView from the getter class
        let tapText = getTapText()
        changeTapText(label: tapText)
        
        var blink = 0
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
            
            blink += 1
            if(blink == 2){
                blink = 0
                tapText.textColor = .white
            } else if(blink == 1){
                tapText.textColor = .black
            }
            
            
            if(self.character.status == "Alive"){
                self.character.health = self.character.health - 10
                print(self.character.health)
            }
            
            if(self.character.health == 0){
                self.character.status = "Deceased"
                
                viewDidLayoutSubviews()
            }
        }
    }
    
    //MARK: - Gesture Recognizer
    
    //A function to tell if the user taps on the screen
    private func GestureRecognizer(viewInstance: UIView) {
    
        let gestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(gestureFired(_:)))
    
        //Amount of taps required
        amountOfTabs(object: gestureRecognizer, numberOfTabs: 10)
    
        let secondGestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(gestureFired(_:)))
    
        //Amount of tabs required
        amountOfTabs(object: secondGestureRecognizer, numberOfTabs: 20)
    
        //Adds the GestureRecognizer to the view
        viewInstance.addGestureRecognizer(gestureRecognizer)
        viewInstance.addGestureRecognizer(secondGestureRecognizer)
        viewInstance.isUserInteractionEnabled = true
    }
    
    //gesture recognizer that changes the character status
    @objc private func gestureFired(_ gesture: UITapGestureRecognizer){
        
        if(self.character.status == "InEgg"){
            self.character.status = "BrokenEgg"
        } else if(self.character.status == "BrokenEgg"){
            self.character.status = "Alive"
        }
        
        changeBackground()
    }
    
    //Function to change the background of the app when the status of the tamagotchi changes
    func changeBackground() {
        
        //Loads a func out of the HelperFunctions Class
        let imageBackground = loadBackground()
        
        //Inizalisation of the background vidoe
        var player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "", ofType: "mp4")!))
        if(self.character.bread == 0){
            player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "yellowEggHatching", ofType: "mp4")!))
        } else if(self.character.bread == 1){
            player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "greenEggHatching", ofType: "mp4")!))
        }
        let vidoeLayer = AVPlayerLayer(player: player)
        vidoeLayer.frame = view.bounds
        vidoeLayer.videoGravity = .resizeAspectFill
        vidoeLayer.name = "vidoeLayer"
    
        player.isMuted = true
        
        //Add or remove the background based on the status of the character
        if(self.character.status == "BrokenEgg"){
            view.layer.addSublayer(vidoeLayer)
            player.play()
        } else if(self.character.status == "Alive"){
            self.view.layer.sublayers?
                .filter{$0.name == "vidoeLayer"}
                .forEach { $0.removeFromSuperlayer() }

            view.insertSubview(imageBackground, at: 0)
        }
    }
    
    func changeCharacter(characterEggView: CharacterView, characterPichuView: CharacterView){
        
        if(self.character.status == "InEgg"){
            if let viewWithTag = self.view.viewWithTag(156){
                viewWithTag.removeFromSuperview()
            }
            self.view.addSubview(characterEggView)
        } else if(self.character.status == "BrokenEgg"){
            if let viewWithTag = self.view.viewWithTag(156){
                viewWithTag.removeFromSuperview()
            }
        } else if(self.character.status == "Alive") {
            self.view.addSubview(characterPichuView)
        } else if(self.character.status == "Deceased"){
            if let viewWithTag = self.view.viewWithTag(126){
                viewWithTag.removeFromSuperview()
            }
        
            character = Character.init(name: "", gender: "", health: 500, food: 100 , sleep: 100, attention: 100, status: "InEgg", bread: Int.random(in: 0...2))
        
            viewDidLayoutSubviews()
        }
        
    }
    
    func changeTapText(label: UILabel){
        
        if(self.character.status == "InEgg"){
            if let viewWithTag = self.view.viewWithTag(243){
                viewWithTag.removeFromSuperview()
            }
            self.view.addSubview(label)
            label.text = "Tap to start"
        } else if(self.character.status == "BrokenEgg"){
            if let viewWithTag = self.view.viewWithTag(243){
                viewWithTag.removeFromSuperview()
            }
            self.view.addSubview(label)
            label.text = "Tap to continue"
        } else if(self.character.status == "Alive"){
            if let viewWithTag = self.view.viewWithTag(243){
                viewWithTag.removeFromSuperview()
            }
        }

    }
    
    
    
    
    
    
    
    
    
    
    
//
//    //Override function to add new subviews to the main view
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        loadBackground()
//
//        //MARK: - Initialization of the healthTimerView
//
//        //Calls the foodTimerView from a viewFile
//        let healthTimerView = TimerView(
//            frame: CGRect(
//                x: 260.0,
//                y: 40.0,
//                width: 50.0,
//                height: 50.0
//            )
//        )
//        healthTimerView.configure(with: 1, with: 5.0, with: 5.0)
//
//        //MARK: - End of initialization of the healthTimerView
//
//
//
//        //MARK: - Initialization of the foodProgressView
//
//        //Calls the CircularProgressSubView from a viewFile
//        let healthProgressView = CircularProgressView(
//            frame: CGRect(
//                x: 265.0,
//                y: 45.0,
//                width: 40.0,
//                height: 40.0
//            )
//        )
//        healthProgressView .trackColor =
//            UIColor(
//                red: 16.0/255.0,
//                green: 52.0/255.0,
//                blue: 173.0/255.0,
//                alpha: 1.0
//            )
//        healthProgressView .progressColor = UIColor.green
//        healthProgressView .tag = 101
//        healthProgressView .layer.zPosition = 10;
//
//        //Calls a methode to animate the progressBar
//        self.perform(#selector(animateProgress), with: nil, afterDelay: 2.0)
//
//        //MARK: - End of initialization of the foodProgressView
//
//
//
//        //MARK: - Initialization of the foodTimerView
//
//        //Calls the attentionTimerView from a viewFile
//        let foodTimerView = TimerView(
//            frame: CGRect(
//                x: 260.0,
//                y: 150.0,
//                width: 50.0,
//                height: 50.0
//            )
//        )
//        foodTimerView.configure(with: 1, with: 5.0, with: 5.0)
//
//        //MARK: - End of initialization of the foodTimerView
//
//
//
//        //MARK: - Initialization of the foodProgressView
//
//        //Calls the CircularProgressSubView from a viewFile
//        let foodProgressView = CircularProgressView(
//            frame: CGRect(
//                x: 265.0,
//                y: 155.0,
//                width: 40.0,
//                height: 40.0
//            )
//        )
//        foodProgressView .trackColor =
//            UIColor(
//                red: 16.0/255.0,
//                green: 52.0/255.0,
//                blue: 173.0/255.0,
//                alpha: 1.0
//            )
//        foodProgressView .progressColor = UIColor.green
//        foodProgressView .tag = 101
//        foodProgressView .layer.zPosition = 10;
//
//        //Calls a methode to animate the progressBar
//        self.perform(#selector(animateProgress), with: nil, afterDelay: 2.0)
//
//        //MARK: - End of initialization of the foodProgressView
//
//
//
//        //MARK: - Initialization of the attentionTimerView
//
//        //Calls the attentionTimerView from a viewFile
//        let attentionTimerView = TimerView(
//            frame: CGRect(
//                x: 260.0,
//                y: 95.0,
//                width: 50.0,
//                height: 50.0
//            )
//        )
//        attentionTimerView.configure(with: 1, with: 5.0, with: 5.0)
//
//        //MARK: - End of initialization of the attentionTimerView
//
//
//
//        //MARK: - Initialization of the attentionProgressView
//
//        //Calls the CircularProgressSubView from a viewFile
//        let attentionProgressView = CircularProgressView(
//            frame: CGRect(
//                x: 265.0,
//                y: 100.0,
//                width: 40.0,
//                height: 40.0
//            )
//        )
//        attentionProgressView .trackColor =
//            UIColor(
//                red: 16.0/255.0,
//                green: 52.0/255.0,
//                blue: 173.0/255.0,
//                alpha: 1.0
//            )
//        attentionProgressView .progressColor = UIColor.green
//        attentionProgressView .tag = 101
//        attentionProgressView .layer.zPosition = 10;
//
//        //Calls a methode to animate the progressBar
//        self.perform(#selector(animateProgress), with: nil, afterDelay: 2.0)
//
//        //MARK: - End of initialization of the attentionProgressView
//
//
//
//        //MARK: - Initialization of the timerView
//
//        //Calls the timerSubView from a viewFile
//        let timerView = TimerView(
//            frame: CGRect(
//                x: 10,
//                y: 40,
//                width: 50,
//                height: 50
//            )
//        )
//
//        //MARK: - End of initialization of the Timerview
//
//
//
//        //MARK: - Initialization of the characterView
//
//        //Calls the characterSubView from a viewFile
//        let characterView = CharacterView(
//            frame: CGRect(
//                x: 0,
//                y: 0,
//                width: 400,
//                height: 450
//            )
//        )
//        characterView.configure(characterPicture: "yellowEgg")
//        characterView.tag = 145
//
//        //Call to a cesturereconiger to register touches on the object
//        GestureRecognizer(viewInstance: characterView)
//
//        let secondCharacterView = CharacterView(
//            frame: CGRect(
//                x: 0,
//                y: 0,
//                width: 400,
//                height: 450
//            )
//        )
//        secondCharacterView.configure(characterPicture: "pichu")
//
//        //MARK: - End of initialization of the characterView
//
//
//
//        //MARK: - Initialization of the timerProgressView
//
//        //Calls the timerProgressView from a viewFile
//        let timerProgressView = CircularProgressView(
//            frame: CGRect(
//                x: 15.0,
//                y: 45.0,
//                width: 40.0,
//                height: 40.0
//            )
//        )
//        timerProgressView.trackColor =
//            UIColor(
//                red: 16.0/255.0,
//                green: 52.0/255.0,
//                blue: 173.0/255.0,
//                alpha: 1.0
//            )
//        timerProgressView.progressColor = UIColor.green
//        timerProgressView.tag = 101
//        timerProgressView.layer.zPosition = 10;
//
//        //Calls a methode to animate the progressBar
//        self.perform(#selector(animateProgress), with: nil, afterDelay: 2.0)
//
//        //MARK: - End of initialization of the timerProgressView
//
//
//
//
//
//        //MARK: - Timer / CountDown
//
//        //Initialization of numbers that are used multiple times in the timer
//        let timeInitialization = 100
//        let progressInitialization = 0.0
//
//        //Amount of second the timer is gonna count from
//        var timeLeft = timeInitialization
//
//        //Startpoint for the progressbar in the timer
//        var progress = progressInitialization
//
//        if(self.character.status == "InEgg"){
//            self.view.addSubview(characterView)
//        } else if(self.character.status == "Alive") {
//            if let viewWithTag = self.view.viewWithTag(145){
//                viewWithTag.removeFromSuperview()
//            }
//            self.view.addSubview(secondCharacterView)
//        }
//
//        if(self.character.status == "Alive"){
//            self.view.addSubview(timerView)
//            self.view.addSubview(timerProgressView)
//            self.view.addSubview(healthTimerView)
//            self.view.addSubview(healthProgressView)
//            self.view.addSubview(attentionTimerView)
//            self.view.addSubview(attentionProgressView)
//            self.view.addSubview(foodTimerView)
//            self.view.addSubview(foodProgressView)
//        }
//
//        if(self.character.status == "Alive"){
//        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] timer in
//
//            //Amount withdrawn every second
//            timeLeft -= 1
//            progress += 0.01
//
//            //Gives the number to the view so it can be added to the label
//            timerView.configure(with: timeLeft, with: 5.0, with: 5.0)
//            timerProgressView.configure(with: progress)
//
//            let healthProgressPercentage = self.character.health / 100
//            healthProgressView.configure(with: healthProgressPercentage)
//
//            let attentionProgressPercentage = self.character.attention / 100
//            attentionProgressView.configure(with: attentionProgressPercentage)
//
//            let foodProgressPercentage = self.character.food / 100
//            foodProgressView.configure(with: foodProgressPercentage)
//
//            if(self.character.status == "Alive"){
//                //Checks if the timer has 0 seconds left
//                if(timeLeft == 0){
//
//                    //Resets the timer and the progressBar of the timer
//                    timeLeft = timeInitialization
//                    progress = progressInitialization
//
//                    //Withdrawds food every time to timer stands on 0
//                    if(self.character.food >= 0){
//                        self.character.food = self.character.food - 10
//                    }
//
//                    //Check of food is 0 and when it is withdraws health until 0
//                    if(self.character.food <= 0 || self.character.attention <= 0){
//                        if(self.character.health <= 0){
//                            self.character.status = "Deceased"
//                            character = Character.init(name: "", gender: "", health: 100, food: 100 , sleep: 100, attention: 100, status: "InEgg")
//
//                        } else {
//                            if(self.character.food <= 0){
//                                self.character.health = self.character.health - 25
//                            }
//                            if(self.character.attention <= 0){
//                                self.character.health = self.character.health - 10
//                            }
//                        }
//                    }
//
//                    //Withdrawds attention every time to timer stands on 0
//                    if(self.character.attention >= 0){
//                        self.character.attention = self.character.attention - 15
//                    }
//
//                    //calls a switch statment that changed the color of the progressView
//                    switchProgress(progressView: healthProgressView, selfCharacter: Int(self.character.health))
//
//                    //calls a switch statment that changed the color of the progressView
//                    switchProgress(progressView: attentionProgressView, selfCharacter: Int(self.character.attention))
//
//                    //calls a switch statment that changed the color of the progressView
//                    switchProgress(progressView: foodProgressView, selfCharacter: Int(self.character.food))
//
//                    //Only for development porpuse
//                    print(character)
//                }
//            }
//        }
//        }
//
//        //MARK: - End of Timer / Countdown
//
//        //Adds the subviews to the main view
//    }
//
////        let gestureRecognizer =  UISwipeGestureRecognizer(target: self, action:
////        #selector(gestureFired(_:)))
////        gestureRecognizer.direction = .right
////        gestureRecognizer.numberOfTouchesRequired = 1
//
//
//    //Function to animate the CircularProgressView/Bar
//    @objc func animateProgress() {
//        if(self.character.status == "Alive"){
//            let cP = self.view.viewWithTag(101) as! CircularProgressView
//            cP.setProgressWithAnimation(duration: 1.0, value: 0.0)
//        }
//    }
//
//    //Function to overwrite memory warnings
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//
//    //MARK: - Swicth statment for progressView
//
//
    
    //MARK: - End of Swicth statment for progressView
    
    //    //MARK: - SwicthProgress Function
    //
    //    //Switch statment that changes the color of the progressViews that call it
    //    func switchProgress(progressView: CircularProgressView, selfCharacter: Int){
    //        switch selfCharacter{
    //            case 50...75:
    //                progressView.progressColor = UIColor(red: 33.0/255.0, green: 161.0/255.0, blue: 21.0/255.0, alpha: 1.0)
    //                break
    //            case  25...50:
    //                progressView.progressColor = UIColor.yellow
    //                break
    //            case 10...25:
    //                progressView.progressColor = UIColor.orange
    //                break
    //            case 0...10:
    //                progressView.progressColor = UIColor.red
    //                break
    //            default:
    //                break
    //        }
    //    }
    //
    //    //MARK: - End of SwicthProgress Function
        
}

