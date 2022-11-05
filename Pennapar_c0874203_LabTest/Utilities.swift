//
//  Utilities.swift
//  Pennapar_c0874203_LabTest
//
//  Created by Alice’z Poy on 2022-11-04.
//

import Foundation

struct Utilities {
    static func timeToString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i.%02i", hours, minutes, seconds)
    }
}
