//
//  TimerViewController.swift
//  Pennapar_c0874203_LabTest
//
//  Created by Alice’z Poy on 2022-11-04.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var countDownTimeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func controlTimingAction(_ sender: Any) {
    }

}
