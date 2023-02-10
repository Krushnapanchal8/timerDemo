//
//  ViewController.swift
//  timerDemo
//
//  Created by Mac on 09/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var playBtn: UIButton!
    
    
    var timer = Timer()
    var counter = 0.0
    var isRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        timerLabel.text = "\(counter)"
    }
    
    @IBAction func resetClick(_ sender: UIButton) {
        timer.invalidate()
        timerLabel.text = String(format: "%.1f", counter)
        counter = 0
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        isRunning = false
    }
    
    
    @IBAction func playClick(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        isRunning = true
    }
    
    @objc func updateTimer() {
        counter += 0.1
        timerLabel.text = String(format: "%.1f", counter)
    }
    
    @IBAction func pauseClick(_ sender: UIButton) {
        timer.invalidate()
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        isRunning = false
    }
    

}

