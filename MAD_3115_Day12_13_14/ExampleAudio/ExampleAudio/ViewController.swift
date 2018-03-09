//
//  ViewController.swift
//  ExampleAudio
//
//  Created by moxDroid on 2017-104-31.
//  Copyright © 2017 moxDroid. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    //Can also use View from Object Library
    var soundPlayEffect: AVAudioPlayer!
    var updater : CADisplayLink! = nil //Update play time
    
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var soundProgressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblCurrentTime.text = "00:00:00"
    }

    @IBAction func startPlay(_ sender: UIBarButtonItem) {
        startAudioPlay()
    }
    @IBAction func stopPlay(_ sender: UIBarButtonItem) {
        stopAudioPlay()
    }
   
    @IBAction func changeVolume(_ sender: UISlider) {
        if soundPlayEffect != nil
        {
            soundPlayEffect.volume = sender.value
        }
    }
    
    func startAudioPlay()
    {

        let path = Bundle.main.path(forResource: "Titanic", ofType:"mp3")
        let url = URL(fileURLWithPath: path!)
    
        do {
            soundPlayEffect = try AVAudioPlayer(contentsOf: url)
            soundPlayEffect.prepareToPlay()
            updater = CADisplayLink(target: self, selector: #selector(ViewController.trackAudio))
            //updater.preferredFramesPerSecond = 1
            updater.add(to: RunLoop.current, forMode: RunLoopMode.commonModes)
             lblCurrentTime.text = "\(soundPlayEffect.currentTime)"
            
            soundPlayEffect.play()
            
        } catch {
                NSLog("Error Loading Audio File")
        }
    }
    
    //Display Progress
    func trackAudio() {
        if soundPlayEffect != nil
        {
            let normalizedTime = Float(soundPlayEffect.currentTime / soundPlayEffect.duration)
            soundProgressBar.progress = normalizedTime
            lblCurrentTime.text = stringFromTimeInterval(interval: soundPlayEffect.currentTime)
        }
    }
    
    func stringFromTimeInterval(interval: TimeInterval) -> String {
        
        let ti = NSInteger(interval)
        
        //let ms = Int(interval.truncatingRemainder(dividingBy: 1) * 1000)
        let seconds = ti % 60
        let minutes = (ti / 60) % 60
        let hours = (ti / 3600)
        
        return NSString(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds) as String
    }

    
    func stopAudioPlay()
    {
        if soundPlayEffect != nil {
            soundPlayEffect.stop()
            soundPlayEffect = nil
        }
        lblCurrentTime.text = "00:00:00"
        soundProgressBar.progress = 0
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer,
        flag: Bool) {
        if flag
        {
            stopAudioPlay()
        }
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer,
                                        error: Error?) {
        NSLog(error.debugDescription)
    }
    
    func audioPlayerBeginInterruption(_ player: AVAudioPlayer) {
    }
    
    func audioPlayerEndInterruption(player: AVAudioPlayer) {
    }

}

