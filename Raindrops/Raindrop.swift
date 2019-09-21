//
//  Raindrop.swift
//  Raindrops
//
//  Created by Andrew Daniel on 9/21/19.
//  Copyright © 2019 Andrew Daniel. All rights reserved.
//

import UIKit

class Raindrop: UIView {
    
    private let startingDiameter: CGFloat = 15
    private let endingDiameter: CGFloat = 325
    
    init(origin: CGPoint) {
        let originOffset: CGFloat = (startingDiameter / 2)
        let centeredOrigin = CGPoint(x: origin.x - originOffset, y: origin.y - originOffset)
        let frame = CGRect(x: centeredOrigin.x, y: centeredOrigin.y, width: startingDiameter, height: startingDiameter)
        
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        layer.borderWidth = 8
        layer.cornerRadius = frame.width / 2
        layer.borderColor = UIColor.white.cgColor
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func animateRipple(completion: ((Bool) -> Void)?) {
        UIView.animate(withDuration: 3.46, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.6, options: .curveEaseOut, animations: {
            self.layer.borderWidth = 1
            
            let originOffset: CGFloat = self.endingDiameter / 2
            self.layer.cornerRadius = originOffset
            
            let origin = self.frame.origin
            self.frame.origin = CGPoint(x: origin.x - originOffset, y: origin.y - originOffset)
            
            self.frame.size = CGSize(width: self.endingDiameter, height: self.endingDiameter)
            self.alpha = 0.0
        }, completion: completion)
    }
    
}
