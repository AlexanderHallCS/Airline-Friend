//
//  SoothingSoundsVC.swift
//  Airline Friend
//
//  Created by Alexander Hall on 1/25/20.
//  Copyright © 2020 Hall Inc. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class SoothingMusicVC: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    
}
