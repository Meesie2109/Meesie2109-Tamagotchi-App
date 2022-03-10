//
//  TimerView.swift
//  Tamagotchi-app
//
//  Created by Mees Rootjes on 09/03/2022.
//

import UIKit

class TimerView: UIView {
    
    //Initialization of a UIlabel used as background for the timer
    private let label: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 22.0/255.0, green: 73.0/255.0, blue: 242.0/255.0, alpha: 1.0)
        label.textColor = .white
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20
        
        return label
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        //BackgroundColor of the timer
        backgroundColor = UIColor(red: 22.0/255.0, green: 73.0/255.0, blue: 242.0/255.0, alpha: 1.0)
        
        layer.masksToBounds = true
        layer.cornerRadius = 25
        
        //Adds the label to the subview
        addSubview(label)
    }
    
    //Function to set a variable amount for the number in the timer
    public func configure(with number: Int){
        label.text = String(number)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Declaration of the space the label takes on the view
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.frame = CGRect(
            x: 5,
            y: 5,
            width: frame.size.width - 10,
            height: frame.size.height - 10
        )
    }
}
