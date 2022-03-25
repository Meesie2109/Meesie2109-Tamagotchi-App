//
//  TextView.swift
//  Tamagotchi-app
//
//  Created by Mees Rootjes on 23/03/2022.
//

import Foundation
import UIKit

class TextView: UIView {
    
   

    public func configure(){}
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.text = "Tap to start"
        label.center = CGPoint(x: 160, y: 485)
        label.textAlignment = .center
        label.textColor = .black
        
        addSubview(label)
        
//        UIView.animate(withDuration: 1) {
//            label.textColor = .white
//        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
