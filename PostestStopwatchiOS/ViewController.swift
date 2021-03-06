//
//  ViewController.swift
//  PostestStopwatchiOS
//
//  Created by Sam Pramudana on 10/23/17.
//  Copyright © 2017 Sam Pramudana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false

    @IBOutlet weak var labelTimer: UILabel!
    @IBOutlet weak var labelStart: UIButton!
    @IBOutlet weak var labelPause: UIButton!
    @IBOutlet weak var labelStop: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTimer.text = String(counter)
        labelPause.isEnabled = false
    }

    @IBAction func btnStart(_ sender: Any) {
        if(isPlaying){
            return
        }
        
        labelStart.isEnabled = false
        labelPause.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = true
        counter = counter + 0.1
    }
    @objc func UpdateTimer() {
        counter = counter + 0.1
        labelTimer.text = String(format: "%.1f", counter)
    }
    @IBAction func btnStop(_ sender: Any) {
        
        labelStart.isEnabled = true
        labelPause.isEnabled = false
        
        timer.invalidate()
        
        isPlaying = false
        
        counter = 0.0
        labelTimer.text = String(counter)
    }
    @IBAction func btnPause(_ sender: Any) {
        
        labelStart.isEnabled = true
        labelPause.isEnabled = false
        
        timer.invalidate()
        isPlaying = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

