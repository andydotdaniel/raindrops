//
//  Raindrop.swift
//  Raindrops
//
//  Created by Andrew Daniel on 9/21/19.
//  Copyright © 2019 Andrew Daniel. All rights reserved.
//

import UIKit

class Raindrop: UIView {
    
    init(origin: CGPoint, diameter: CGFloat) {
        let frame = CGRect(x: origin.x, y: origin.y, width: diameter, height: diameter)
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = frame.width / 2
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
