//
//  ViewController.swift
//  stopWatch
//
//  Created by Mathieu Janneau on 26/02/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  // MARK: - PROPERTIES & OUTLETS
  var isCounting: Bool = false
  var timer = Timer()
  var count = 0
  @IBOutlet weak var countDisplay: UILabel!
  @IBOutlet weak var startPauseButton: UIButton!
  
  override func viewDidLoad() {
    print(isCounting)
    super.viewDidLoad()
    isCounting = false
  }


  // MARK: - ACTIONS
  @IBAction func start(_ sender: UIButton) {
    iconUpdate(sender)
    }
  @IBAction func stop(_ sender: UIButton) {
    timer.invalidate()
    resetPlayButton()
  }
  @IBAction func reset(_ sender: UIButton) {
    timer.invalidate()
    resetPlayButton()
    count = 0
    countDisplay.text = "00:00:00"
  }
  
  
  fileprivate func iconUpdate(_ sender: UIButton) {
    if isCounting  {
      resetPlayButton()
      timer.invalidate()
    } else {
      
      sender.setImage(UIImage(named: "pause.png"), for: .normal)
      isCounting = true
      timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
      
    }
  }
  @objc func counter() {
    
    count += 1
    let countMS = count.msToSeconds.minuteSecondMS
    countDisplay.text = "\(countMS)"
  }
  
  func resetPlayButton() {
    startPauseButton.setImage(UIImage(named: "play.png"), for: .normal)
    isCounting = false
  }
  
}


