//
//  stopWatch.swift
//  stopWatch
//
//  Created by Mathieu Janneau on 26/02/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import Foundation

struct StopWatch {
  var startTime = TimeInterval()
  func runTimer() -> String {
    let currentTime = NSDate.timeIntervalSinceReferenceDate
    var elapsedTime: TimeInterval = currentTime - startTime
    
    let minutes = Int(elapsedTime/60)
    elapsedTime -= (TimeInterval(minutes) * 60)
    let seconds = Int(elapsedTime)
    elapsedTime -= TimeInterval(seconds)
    let fractions = Int(elapsedTime * 100)
    let strMinutes = String(format:"%02d", minutes)
    let strSeconds = String(format:"%02d", seconds)
    let strFractions = String(format:"%02d", fractions)
    
    let timerString = "\(strMinutes):\(strSeconds):\(strFractions)"
    return timerString
  }
}
