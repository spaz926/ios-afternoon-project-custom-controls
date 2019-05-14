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
    
    private func setup() {
        
        var labels = [UILabel]()
        
        for i in 0..<componentCount {
            let label = UILabel()
            label.text = "☆"
            label.tag = i + 1
            label.font = .systemFont(ofSize: 32, weight: .bold)
            label.textAlignment = .center
            
            if label.tag == 1 {
                label.frame = CGRect(x: 8.0, y: 0, width: componentDimension, height: componentDimension)
                label.textColor = componentActiveColor
            } else {
                label.frame = CGRect(x: (componentDimension * CGFloat(i)) + 16.0, y: 0, width: componentDimension, height: componentDimension)
                label.textColor = componentInactiveColor
            }
            
            self.addSubview(label)
            labels.append(label)
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
