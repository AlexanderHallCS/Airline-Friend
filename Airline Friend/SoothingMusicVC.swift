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
    
    @IBAction func playVibesButton(_ sender: UIButton) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "2019-08-09_-_Vibes_-_www.FesliyanStudios.com_-_David_Renda", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
        }
        catch {
            print("The audio file was not found!")
        }
        
        if(audioPlayer.isPlaying == false) {
            audioPlayer.play()
        }
        audioPlayer.numberOfLoops = -1
    }
    
    @IBAction func playStringsOfTimeButton(_ sender: UIButton) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "2016-05-06_-_Strings_of_Time_-_David_Fesliyan", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
        }
        catch {
            print("The audio file was not found!")
        }
        
        if(audioPlayer.isPlaying == false) {
            audioPlayer.play()
        }
        audioPlayer.numberOfLoops = -1
    }
    
    @IBAction func playTranquilityButton(_ sender: UIButton) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "2019-04-26_-_Tranquility_-_www.fesliyanstudios.com", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
        }
        catch {
            print("The audio file was not found!")
        }
        
        if(audioPlayer.isPlaying == false) {
            audioPlayer.play()
        }
        audioPlayer.numberOfLoops = -1
    }
    
    @IBAction func stopMusicButton(_ sender: UIButton) {
        audioPlayer.stop()
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    
}
