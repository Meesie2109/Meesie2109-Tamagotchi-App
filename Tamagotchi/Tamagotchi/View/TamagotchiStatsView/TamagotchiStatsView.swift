//
//  TamagotchiStatsView.swift
//  Tamagotchi
//
//  Created by Mees Rootjes on 31/03/2022.
//

import UIKit

final class TamagotchiStatsView: UIView{
    
    let ViewModel = TamagotchiStatsViewModel()
    
    private func button() -> UIButton{
        
        let button = UIButton()
        button.frame = CGRect(x: 140, y: 35, width: 175, height: 100)
        button.backgroundColor = UIColor(red: 230.0/255.0, green: 177.0/255.0, blue: 92.0/255.0, alpha: 1.0)
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        
        return button
    }
    
    private let label: UILabel = {
        
        let label = UILabel()
        label.text = "Health"
        label.frame = CGRect(x: 150, y: 41, width: 100, height: 20)
        label.font = UIFont.systemFont(ofSize: 10.0)
        
        return label
    }()
    
    private let progressBar: UIProgressView = {
        let progressBar = UIProgressView()
       
        progressBar.progressTintColor = .green
        progressBar.trackTintColor = .black
        progressBar.progressViewStyle = .default
        progressBar.frame = CGRect(x: 200, y: 50, width: 100, height: 20)
        
        return progressBar
    }()
    
    private let attentionLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Attention"
        label.frame = CGRect(x: 150, y: 61, width: 100, height: 20)
        label.font = UIFont.systemFont(ofSize: 10.0)
        
        return label
    }()
    
    private let attentionprogressBar: UIProgressView = {
        let progressBar = UIProgressView()
       
        progressBar.progressTintColor = .green
        progressBar.trackTintColor = .black
        progressBar.progressViewStyle = .default
        progressBar.frame = CGRect(x: 200, y: 70, width: 100, height: 20)
        
        return progressBar
    }()
    
    private let foodLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Food"
        label.frame = CGRect(x: 150, y: 81, width: 100, height: 20)
        label.font = UIFont.systemFont(ofSize: 10.0)
        
        return label
    }()
    
    private let foodprogressBar: UIProgressView = {
        let progressBar = UIProgressView()
       
        progressBar.progressTintColor = .green
        progressBar.trackTintColor = .black
        progressBar.progressViewStyle = .default
        progressBar.frame = CGRect(x: 200, y: 90, width: 100, height: 20)
        
        return progressBar
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(button())
        addSubview(label)
        addSubview(progressBar)
        addSubview(attentionLabel)
        addSubview(attentionprogressBar)
        addSubview(foodLabel)
        addSubview(foodprogressBar)
    }
    
    var progress = 0.0
    public func configure(Progress: Double, attentionProgress: Double, foodProgess: Double){
        ViewModel.getcolor(progressOne: Progress, progressBar: progressBar)
        ViewModel.getcolor(progressOne: attentionProgress, progressBar: attentionprogressBar)
        ViewModel.getcolor(progressOne: foodProgess, progressBar: foodprogressBar)
        
        progressBar.progress = Float(Progress)
        attentionprogressBar.progress = Float(attentionProgress)
        foodprogressBar.progress = Float(foodProgess)
    }
}
