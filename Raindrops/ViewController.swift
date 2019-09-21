//
//  ViewController.swift
//  Raindrops
//
//  Created by Andrew Daniel on 9/21/19.
//  Copyright © 2019 Andrew Daniel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let tapView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.18, green: 0.16, blue: 0.17, alpha: 1.0)
        initialSetup()
    }

    private func initialSetup() {
        view.addSubview(tapView)
        tapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onScreenTapped))
        tapView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func onScreenTapped(gestureRecognizer: UITapGestureRecognizer) {
        let tapPosition = gestureRecognizer.location(in: view)
        let raindrop = Raindrop(origin: tapPosition)
        view.addSubview(raindrop)
        view.sendSubviewToBack(raindrop)
        
        raindrop.animateRipple() { _ in
            raindrop.removeFromSuperview()
        }
    }

}

