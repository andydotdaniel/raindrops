//
//  ViewController.swift
//  Raindrops
//
//  Created by Andrew Daniel on 9/21/19.
//  Copyright © 2019 Andrew Daniel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.18, green: 0.16, blue: 0.17, alpha: 1.0)
        initialSetup()
    }

    private func initialSetup() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onScreenTapped))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func onScreenTapped(gestureRecognizer: UITapGestureRecognizer) {}

}

