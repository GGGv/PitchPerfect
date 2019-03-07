//
//  PlaySoundViewController.swift
//  PitchPerfect
//
//  Created by 牛晓芙 on 3/6/19.
//  Copyright © 2019 牛晓芙. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {
    
    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    @IBOutlet var myButtons:  [UIButton]!
    @IBOutlet weak var snailButton:  UIButton!
    @IBOutlet weak var chipmunkButton:  UIButton!
    @IBOutlet weak var rabbitButton:  UIButton!
    @IBOutlet weak var vaderButton:  UIButton!
    @IBOutlet weak var echoButton:  UIButton!
    @IBOutlet weak var reverbButton:  UIButton!
    @IBOutlet weak var stopButton:  UIButton!


    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        stopAudio()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for button in self.myButtons  {
            button.imageView?.contentMode =  .scaleAspectFit
        }
        setupAudio()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }

}
