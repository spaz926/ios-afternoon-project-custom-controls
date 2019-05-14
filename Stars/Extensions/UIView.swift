//
//  UIView.swift
//  Stars
//
//  Created by Jeffrey Carpenter on 5/14/19.
//  Copyright © 2019 Jeffrey Carpenter. All rights reserved.
//

import UIKit

extension UIView {
    
    // "Flare view" animation sequence
    func performFlare() {
        func flare() { transform = CGAffineTransform(scaleX: 1.6, y: 1.6) }
        func unflare() { transform = .identity }
        
        UIView.animate(withDuration: 0.3, animations: { flare(); self.rotate360Degrees()}, completion: { _ in UIView.animate(withDuration: 0.1, animations: { unflare() })})
    }
    
    func rotate360Degrees() {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(.pi * 2.0)
        
        self.layer.add(rotateAnimation, forKey: nil)
    }
}
