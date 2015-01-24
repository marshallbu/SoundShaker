//
//  ViewController.swift
//  SoundShaker
//
//  Created by Marshall Upshur on 1/23/15.
//  Copyright (c) 2015 Marshall Upshur. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()
    var files = ["applause", "blop", "golf", "punch"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        if event.subtype == UIEventSubtype.MotionShake {
            println("user shook")
            
            var randomNumber = Int(arc4random_uniform(UInt32(files.count)))
            
            println(files[randomNumber])
            var fileLocation:NSURL = NSBundle.mainBundle().URLForResource(files[randomNumber], withExtension: "mp3")!
            
            var error:NSError? = nil
            
            player = AVAudioPlayer(contentsOfURL: fileLocation, error: &error)
            
            player.play()
        }
    }

}

