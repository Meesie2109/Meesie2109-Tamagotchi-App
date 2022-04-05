//
//  CollectionView.swift
//  Tamagotchi
//
//  Created by Mees Rootjes on 30/03/2022.
//

import UIKit

final class CollectionView: UIView{
    
    let ViewModel = CollectionViewModel()
    
    var textLabel: UILabel = {
        var label = UILabel()
        
        label.text = "Collection"
        label.frame = CGRect(x: 20, y: -22, width: 280, height: 90)
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.font = label.font.withSize(25)
        label.textColor = .white
        
        return label
    }()
    
    func imageLayer() -> UILabel {
        let label = UILabel()
        
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 15
        label.layer.borderColor = UIColor.black.cgColor
        
        return label
    }
    
    func tamagochiImage(images: String, y: Int, x: Int) -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: images)
        image.contentMode = .scaleAspectFill
        image.frame = CGRect(x: x, y: y, width: 80, height: 85)
        
        return image
    }
    
    func collectionLayer(){
        let firstImageLayer = imageLayer()
        firstImageLayer.frame = CGRect(x: 20, y: 65, width: 280, height: 100)
        addSubview(firstImageLayer)
        
        let firstTamagotchiImage = tamagochiImage(images: "tamagotchiFourteen", y: 70, x: 20)
        addSubview(firstTamagotchiImage)
        
        let secondTamagotchiImage = tamagochiImage(images: "tamagotchiTwo", y: 70, x: 85 )
        addSubview(secondTamagotchiImage)
        
        let thirdTamagotchiImage = tamagochiImage(images: "tamagotchiThree", y: 70, x: 150 )
        addSubview(thirdTamagotchiImage)
        
        let fourthTamagotchiImage = tamagochiImage(images: "tamagotchiFour", y: 70, x: 215 )
        addSubview(fourthTamagotchiImage)
        
        let secondImageLayer = imageLayer()
        secondImageLayer.frame = CGRect(x: 20, y: 180, width: 280, height: 100)
        addSubview(secondImageLayer)
        
        let fifthTamagotchiImage = tamagochiImage(images: "tamagotchiFive", y: 185, x: 20)
        addSubview(fifthTamagotchiImage)
        
        let sixedTamagotchiImage = tamagochiImage(images: "tamagotchiSix", y: 185, x: 85 )
        addSubview(sixedTamagotchiImage)
        
        let seventTamagotchiImage = tamagochiImage(images: "tamagotchiSeven", y: 185, x: 150 )
        addSubview(seventTamagotchiImage)
        
        let eightTamagotchiImage = tamagochiImage(images: "tamagotchiEight", y: 185, x: 215 )
        addSubview(eightTamagotchiImage)
        
        let thirdImageLayer = imageLayer()
        thirdImageLayer.frame = CGRect(x: 20, y: 295, width: 280, height: 100)
        addSubview(thirdImageLayer)
        
        let NineTamagotchiImage = tamagochiImage(images: "tamagotchiNine", y: 305, x: 20)
        addSubview(NineTamagotchiImage)
        
        let tenTamagotchiImage = tamagochiImage(images: "tamagotchiTen", y: 305, x: 85 )
        addSubview(tenTamagotchiImage)
        
        let ElevenTamagotchiImage = tamagochiImage(images: "tamagotchiEleven", y: 305, x: 150 )
        addSubview(ElevenTamagotchiImage)
        
        let twelveTamagotchiImage = tamagochiImage(images: "tamagotchiTwelve", y: 305, x: 215 )
        addSubview(twelveTamagotchiImage)
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        collectionLayer()
        
        backgroundColor = UIColor(red: 230.0/255.0, green: 177.0/255.0, blue: 92.0/255.0, alpha: 1.0)
        frame = CGRect(x: 0, y: 50, width: 320, height: 470)
        layer.cornerRadius = 15
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
    }
}
