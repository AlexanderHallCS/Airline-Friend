//
//  AirportHelpVC.swift
//  Airline Friend
//
//  Created by Alexander Hall on 1/25/20.
//  Copyright © 2020 Hall Inc. All rights reserved.
//

import Foundation
import UIKit

class AirportHelpVC: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /*@IBOutlet weak var stepsToHaveLabel: UILabel! {
        didSet {
            let attributedString = NSMutableAttributedString.init(string: stepsToHaveLabel.text!)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSRange.init(location: 0, length: attributedString.length))
            stepsToHaveLabel.attributedText = attributedString
        }
    }
    @IBOutlet weak var easyTimeLabel: UILabel! {
        didSet {
            
        }
    } */
    
    @IBAction func unwindToBranchNavigator(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
