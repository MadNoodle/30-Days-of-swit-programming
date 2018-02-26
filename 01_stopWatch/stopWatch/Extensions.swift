//
//  Extensiosn.swift
//  stopWatch
//
//  Created by Mathieu Janneau on 26/02/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import Foundation

extension TimeInterval {
  var minuteSecondMS: String {
    return String(format:"%02d:%02d:%02d", minute, second, millisecond)
  }
  var minute: Int {
    return Int((self/60).truncatingRemainder(dividingBy: 60))
  }
  var second: Int {
    return Int(truncatingRemainder(dividingBy: 60))
  }
  var millisecond: Int {
    return Int((self*100).truncatingRemainder(dividingBy: 100))
  }
}

extension Int {
  var msToSeconds: Double {
    return Double(self) / 100
  }
}
