//
//  ViewController.swift
//  Day6MoreControls
//
//  Created by Jigisha Patel on 2018-02-26.
//  Copyright © 2018 JK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lblStepperValue: UILabel!
    @IBOutlet var myStepper: UIStepper!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var moodsSegment: UISegmentedControl!
    @IBOutlet var imgMood: UIImageView!
    @IBOutlet var mySlider: UISlider!
    @IBOutlet var lblSliderValue: UILabel!
    @IBOutlet var myProgressView: UIProgressView!
    @IBOutlet var lblProgress: UILabel!
    var moodImages: [UIImage] = [
        UIImage(named: "happy.jpeg")!,
        UIImage(named: "angry.jpeg")!,
        UIImage(named: "sad.jpeg")!
    ]
    var progressTimer = Timer()
    
    @IBAction func btnStartProgressAction(_ sender: UIButton) {
        self.myProgressView.progress += 0.01
        
        // set label for progress value
        self.lblProgress.text = "\(Int(self.myProgressView.progress * 100))%"
        
        // invalidate timer if progress reach to 1
        if self.myProgressView.progress >= 1 {
            // invalidate timer
            self.progressTimer.invalidate()
        }
    }
    
    @IBAction func mySliderAction(_ sender: UISlider) {
        lblSliderValue.text = String(mySlider.value)
    }
 
    @IBAction func myStepperAction(_ sender: UIStepper) {
        lblStepperValue.text = String(myStepper.value)
    }
    
    @IBAction func btnStartAction(_ sender: UIButton) {
        activityIndicator.startAnimating()
    }
    
    @IBAction func btnStopAction(_ sender: UIButton) {
        activityIndicator.stopAnimating()
    }
    
    @IBAction func segmentChange(_ sender: UISegmentedControl) {
        print("selected : \(moodsSegment.selectedSegmentIndex)")
        
        imgMood.image = moodImages[moodsSegment.selectedSegmentIndex]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myProgressView.progress = 0.0
        lblProgress.text = "\(Int(myProgressView.progress*100))%"
        self.progressTimer = Timer.scheduledTimer(timeInterval: 0.2, target: self,   selector: #selector(self.btnStartProgressAction), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

