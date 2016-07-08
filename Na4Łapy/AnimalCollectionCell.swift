//
//  AnimalCardView.swift
//  Na4Łapy
//
//  Created by Wojciech Bilicki on 20/06/16.
//  Copyright © 2016 Koduj dla Polski. All rights reserved.
//

import UIKit

//Karta określająca sposób prezentacji danych dotyczących zwierzaka

class AnimalCollectionCell: UICollectionViewCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        self.animalImage.layer.cornerRadius = 15.0
//        self.animalImage.clipsToBounds = true
        let animalImageMask = CAShapeLayer()
        animalImageMask.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: UIRectCorner.TopLeft.union(.TopRight), cornerRadii: CGSizeMake(10, 10)).CGPath
        self.animalImage.layer.mask = animalImageMask
    }

    //MARK: Public API
    
    var animal: Animal? {
        didSet {
            updateUI()
        }
    }
    
    //MARK: Private
 
    @IBOutlet weak var animalActivityLevelIcon: UIImageView! 
    
    @IBOutlet weak var animalGenderIcon: UIImageView!
    
    @IBOutlet weak var animalSizeIcon: UIImageView!
    
    @IBOutlet weak var animalDescriptionLabel: UILabel!
    
    @IBOutlet weak var animalImage: UIImageView!
    
    
    private func updateUI() {
        animalDescriptionLabel.text! = (animal?.getDescription())!
        animalImage.image = animal?.getFirstImage()
        
        if let animalSize = animal?.size?.pl() {
            animalSizeIcon.image = UIImage(named: animalSize)
        }
        
        if let animalGender = animal?.gender?.pl() {
            animalGenderIcon.image = UIImage(named: animalGender)
        }
        
        if let animalActivityLevel = animal?.activity?.pl() {
            animalActivityLevelIcon.image = UIImage(named: animalActivityLevel)
        }
        
        
    }
    
}
