//
//  ViewController.swift
//  PanTesting
//
//  Created by Mitchell Porter on 3/3/16.
//  Copyright © 2016 Mentor Ventures, Inc. All rights reserved.
//

import UIKit
import MotionAnimation

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var redView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func handleGesture(pan: LZPanGestureRecognizer) {
        
        // high stiffness means high acceleration (will help it stay under touch)
        if pan.state == .Ended {
            redView.m_animate("center", to: view.center, stiffness:50, damping:25)
        }
        
        if pan.state == .Changed {
            let point = pan.locationInView(view)
            redView.m_animate("center", to: point, stiffness:50, damping:25)
        }
    }
}

