//
//  HelperFunctions.swift
//  Tamagotchi-app
//
//  Created by Mees Rootjes on 18/03/2022.
//

import Foundation
import UIKit

class helperFunctions: UIViewController{
    
    
    //MARK: - SwicthProgress Function
    
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
    
    //MARK: - End of SwicthProgress Function
}
