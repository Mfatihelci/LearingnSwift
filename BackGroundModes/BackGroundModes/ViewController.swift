//
//  ViewController.swift
//  BackGroundModes
//
//  Created by fatih on 28.02.2022.
//

import UIKit
import AVFoundation



class ViewController: UIViewController {
    
    var sesOynatici:AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let dosyaYolu = Bundle.main.path(forResource: "music", ofType: ".mp3")
            
            sesOynatici = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: dosyaYolu!))
            
            sesOynatici.prepareToPlay()
        } catch{
            print(error.localizedDescription)
        }
        
    }

    @IBAction func Basla(_ sender: Any) {
        sesOynatici.play()
    }
    @IBAction func Dur(_ sender: Any) {
        sesOynatici.stop()
    }
    
}

