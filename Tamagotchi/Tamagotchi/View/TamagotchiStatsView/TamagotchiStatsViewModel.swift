//
//  TamagotchiStatsViewModel.swift
//  Tamagotchi
//
//  Created by Mees Rootjes on 31/03/2022.
//

import UIKit

final class TamagotchiStatsViewModel: ObservableObject{
    
    func getcolor(progressOne: Double, progressBar: UIProgressView){
        if(progressOne > 0.6 && progressOne <= 0.8){
            progressBar.progressTintColor = UIColor(red: 38.0/255.0, green: 212.0/255.0, blue: 53.0/255.0, alpha: 1.0)
        } else if(progressOne > 0.4 && progressOne <= 0.6){
            progressBar.progressTintColor = UIColor(red: 33.0/255.0, green: 161.0/255.0, blue: 21.0/255.0, alpha: 1.0)
        } else if(progressOne > 0.2 && progressOne <= 0.4){
            progressBar.progressTintColor = UIColor.yellow
        } else if(progressOne > 0.1 && progressOne <= 0.2){
            progressBar.progressTintColor = UIColor.orange
        } else if(progressOne <= 0.1){
            progressBar.progressTintColor = UIColor.red
        }
    }
}
