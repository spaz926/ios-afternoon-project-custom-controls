//
//  CustomControl.swift
//  Stars
//
//  Created by Jeffrey Carpenter on 5/14/19.
//  Copyright © 2019 Jeffrey Carpenter. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value = 1
    
    private var labels = [UILabel]()
    
    private let componentDimension      = CGFloat(40.0)
    private let componentCount          = 5
    private let componentActiveColor    = UIColor.black
    private let componentInactiveColor  = UIColor.gray
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    // MARK: - Touch Handlers
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
    
        updateValue(at: touch)
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside])
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchDragOutside])
        }
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside])
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        
        for i in 0..<componentCount {
            let label = UILabel()
            label.text = "⭐️"
            label.tag = i + 1
            label.font = .systemFont(ofSize: 32, weight: .bold)
            label.textAlignment = .center
            
            if label.tag == 1 {
                label.frame = CGRect(x: 8.0, y: 0, width: componentDimension, height: componentDimension)
                label.alpha = 1
            } else {
                label.frame = CGRect(x: (componentDimension * CGFloat(i)) + 8.0, y: 0, width: componentDimension, height: componentDimension)
                label.alpha = 0.25
            }
            
            self.addSubview(label)
            labels.append(label)
        }
    }
    
    private func updateValue(at touch: UITouch) {
        
        let touchPoint = touch.location(in: self)
        
        for label in labels {
            if label.frame.contains(touchPoint) {
                if value != label.tag {
                    value = label.tag
                    updateLabelColor()
                    label.performFlare()
                    sendActions(for: [.valueChanged])
                }
            }
        }
    }
    
    private func updateLabelColor() {
        
        for label in self.subviews {
            
            if let label = label as? UILabel {
                if label.tag <= value {
                    label.alpha = 1
                } else {
                    label.alpha = 0.25
                }
            }
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}
