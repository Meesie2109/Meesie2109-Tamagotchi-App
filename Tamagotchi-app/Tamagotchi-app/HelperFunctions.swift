//
//  HelperFunctions.swift
//  Tamagotchi-app
//
//  Created by Mees Rootjes on 18/03/2022.
//

import Foundation
import UIKit

//Class to store all functions that are helping the viewController on one or more aocassions
class helperFunctions: viewGetter{
    
    
    //MARK: - GestureRecognizer Amount of Tabs
    
    func amountOfTabs(object: UITapGestureRecognizer, numberOfTabs: Int){
        object.numberOfTapsRequired = numberOfTabs
        object.numberOfTouchesRequired = 1
    }
    
    //MARK: - End of GestureRecognizer Amount of Tabs
    
    
    
    //MARK: loadBackground
    
    func loadBackground() -> UIImageView{
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
        return backgroundImage
    }
    
    //MARK: - End of loadBackground
}
