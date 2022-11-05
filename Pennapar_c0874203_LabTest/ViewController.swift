//
//  ViewController.swift
//  Pennapar_c0874203_LabTest
//
//  Created by Alice’z Poy on 2022-11-04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timingLabel: UILabel!
    @IBOutlet weak var startTimerButton: UIButton!
    @IBOutlet weak var lapButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var timer = Timer()
    var seconds = 0.0
    var isStarted = false
    var lapTimeStamp = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func runTimer() {
        startTimerButton.setTitle("Stop", for: .normal)
        lapButton.setTitle("Lap", for: .normal)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        startTimerButton.setTitle("Start", for: .normal)
        lapButton.setTitle("Restart", for: .normal)
        timer.invalidate()
    }
    
    func resetTimer() {
        seconds = 0.0
        timingLabel.text = "0.0"
        lapButton.setTitle("Lap", for: .normal)
        lapTimeStamp.removeAll()
        tableView.reloadData()
    }
    
    @objc func updateTimer() {
        seconds += 1.0
        timingLabel.text = Utilities.timeToString(time: TimeInterval(seconds))
        print(lapTimeStamp)
    }

    @IBAction func controlTimeAction(_ sender: UIButton) {
        if sender.titleLabel?.text == "Start" {
            runTimer()
        } else {
            stopTimer()
        }
    }
    
    @IBAction func lapAndResetAction(_ sender: UIButton) {
        if sender.titleLabel?.text == "Lap" {
            lapTimeStamp.append(timingLabel.text ?? "00:00:00")
            tableView.reloadData()
        } else {
            resetTimer()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lapTimeStamp.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LapTimeTableViewCell", for: indexPath) as? LapTimeTableViewCell
        cell?.timeLabel.text = lapTimeStamp[indexPath.row]
        cell?.labNoLabel.text = "Lap \(indexPath.row)"
        return cell ?? UITableViewCell()
    }
}

