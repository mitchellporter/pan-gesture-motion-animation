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
    var redPoint: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        redPoint = redView.center
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        redPoint = redView.center
    }

    @IBAction func handleGesture(pan: LZPanGestureRecognizer) {
        
        let velocity = pan.velocityInView(view).y
        
        // high stiffness means high acceleration (will help it stay under touch)
        if pan.state == .Ended {
            
            redView.m_animate("center", to: redPoint, stiffness:50, damping:25)
        }
        
        if pan.state == .Changed {
            let point = pan.locationInView(view)
            
            // Track velocity to detect pan direction
            // You've set a max value, up and down, that the view is allowed to move to
            if velocity > 0.0 {
                print("down")
                redView.m_animate("center", to: CGPointMake(redView.center.x, min(redPoint.y + 100.0,point.y)), stiffness:50, damping:25)
            } else {
                print("up")
                redView.m_animate("center", to: CGPointMake(redView.center.x, max(redPoint.y - 100.0,point.y)), stiffness:50, damping:25)
            }
        }
    }
}

