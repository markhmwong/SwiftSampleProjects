//
//  ViewController.swift
//  AVSample01
//
//  Created by Mark Wong on 6/10/18.
//  Copyright © 2018 Mark Wong. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let engine = AVAudioEngine()
    let audioSession = AVAudioSession.sharedInstance()
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            
            try audioSession.setCategory(AVAudioSession.Category.playAndRecord, mode: .voiceChat, options: .defaultToSpeaker)
            try audioSession.overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
            try audioSession.setActive(true, options: AVAudioSession.SetActiveOptions.notifyOthersOnDeactivation)
            
        } catch {
            print(error)
        }
        let input = engine.inputNode
        let player = AVAudioPlayerNode()
        var reverbNode = AVAudioUnitReverb()
        engine.attach(player)
        reverbNode.loadFactoryPreset( AVAudioUnitReverbPreset.cathedral)
        reverbNode.wetDryMix = 100
        // Attach the audio effect node corresponding to the user selected effect
        engine.attach(reverbNode)
        

        let bus = 0
        let inputFormat = input.inputFormat(forBus: bus)
        engine.connect(player, to: engine.mainMixerNode, format: inputFormat)
        
        input.installTap(onBus: bus, bufferSize: 512, format: inputFormat) { (buffer, time) -> Void in
            player.scheduleBuffer(buffer)
            print(buffer)
        }
        
        try! engine.start()
        player.volume = 20
        player.play()

        
    }
}

