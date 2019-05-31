//
//  ViewController.swift
//  PitchPerfect
//
//  Created by RUSHIL on 2019-05-30.
//  Copyright © 2019 ibm. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    private var isRecording = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func recordAudio(_ sender: UIButton) {
        if (isRecording) {
            print("Stop recording audio")
            sender.setTitle("Record", for: .normal)
        }
        else {
            print("Now recording audio")
            let session = AVAudioSession.sharedInstance()
            session.requestRecordPermission({(granted: Bool) -> Void in
                if granted {
                    do {
                        DispatchQueue.main.async {
                            sender.setTitle("Stop Recording", for: .normal)
                        }
                        
                        try session.setCategory(.record, mode: .default)
                        try session.setActive(true)
                    } catch {
                        print("Error occurred trying to start recording")
                    }
                } else {
                    print("Permission not given to record")
                }
            })
        }
        isRecording = !isRecording
    }
}

