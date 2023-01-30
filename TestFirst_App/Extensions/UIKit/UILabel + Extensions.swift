//
//  UILabel + Extensions.swift
//  TestFirst_App
//
//  Created by Aleksandr Kan on 30/01/23.
//

import UIKit

extension UILabel {
    
    convenience init(text: String) {
        self.init(frame: .zero)
        self.text = text
        textAlignment = .left
        textColor = .specialLightBrown
        font = .robotMedium14()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
