//
//  TimerViewController.swift
//  Pennapar_c0874203_LabTest
//
//  Created by Alice’z Poy on 2022-11-04.
//

import UIKit
import AVFoundation


class TimerViewController: UIViewController {

    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var countDownTimeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    var seconds = 0.0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        pasueTimer()
        timePicker.isHidden = false
        countDownTimeLabel.isHidden = true
    }
    
    func runTimer() {
        timePicker.isHidden = true
        countDownTimeLabel.isHidden = false
        if seconds <= 0 {
            seconds = timePicker.countDownDuration
        }
        startButton.setTitle("Pause", for: .normal)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    func pasueTimer() {
        startButton.setTitle("Start", for: .normal)
        timer.invalidate()
    }
    
    @objc func updateTimer() {
        seconds -= 1.0
        countDownTimeLabel.text = Utilities.timeToString(time: TimeInterval(seconds))
        
        if seconds <= 0 {
            pasueTimer()
            showAlert()
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Alert", message: "TIME OUT", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Click", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func controlTimingAction(_ sender: UIButton) {
        if sender.titleLabel?.text == "Start" {
            runTimer()
        } else {
            pasueTimer()
        }
    }
}
