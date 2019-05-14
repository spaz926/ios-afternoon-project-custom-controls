//
//  ViewController.swift
//  Stars
//
//  Created by Jeffrey Carpenter on 5/14/19.
//  Copyright © 2019 Jeffrey Carpenter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        
        if ratingControl.value == 1 {
            navigationItem.title = "User Rating: 1 star"
        } else {
            navigationItem.title = "User Rating: \(ratingControl.value) stars"
        }
    }
}
