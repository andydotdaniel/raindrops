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
    
    private var instructionsLabel: UILabel? = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tap on the screen to start the raindrops."
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment(.center)
        label.alpha = 0.0
        return label
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
        setupInstructions()
        setupTapView()
        
        showInstructions()
    }
    
    private func setupInstructions() {
        guard let instructionsLabel = self.instructionsLabel else { return }
        view.addSubview(instructionsLabel)
        
        instructionsLabel.sizeToFit()
        instructionsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        let views = ["label": instructionsLabel]
        view.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-16-[label]-16-|",
            options: [],
            metrics: nil,
            views: views)
        )
    }
    
    private func showInstructions() {
        UIView.animate(withDuration: 0.25, delay: 0.5, options: [], animations: {
            self.instructionsLabel?.alpha = 1.0
        }, completion: nil)
    }
    
    private func setupTapView() {
        view.addSubview(tapView)
        tapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onScreenTapped))
        tapView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func onScreenTapped(gestureRecognizer: UITapGestureRecognizer) {
        if let _ = self.instructionsLabel {
            hideInstructionsLabel()
        }
        
        let tapPosition = gestureRecognizer.location(in: view)
        let raindrop = Raindrop(origin: tapPosition)
        view.addSubview(raindrop)
        view.sendSubviewToBack(raindrop)
        
        raindrop.animateRipple() { _ in
            raindrop.removeFromSuperview()
        }
    }
    
    private func hideInstructionsLabel() {
        UIView.animate(withDuration: 0.175, animations: {
            self.instructionsLabel?.alpha = 0.0
        }, completion: { _ in
            self.instructionsLabel?.removeFromSuperview()
        })
    }

}

