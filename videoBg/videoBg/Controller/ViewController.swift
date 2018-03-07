//
//  ViewController.swift
//  videoBg
//
//  Created by Mathieu Janneau on 07/03/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit

class ViewController: VideoSplashViewController {
  
  @IBOutlet weak var button: UILabel!
  override var preferredStatusBarStyle : UIStatusBarStyle {
    return UIStatusBarStyle.lightContent
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    setupVideoBg()
    setupButton()
  }

  private func setupButton(){
    button.layer.borderColor = UIColor.white.cgColor
    button.layer.borderWidth = 2.0
    
  
  }

  private func setupVideoBg(){
    
    let url = URL(fileURLWithPath: Bundle.main.path(forResource: "ghost", ofType: "mp4")!)
      
      videoFrame = view.frame
      fillMode = .resizeAspectFill
      alwaysRepeat = true
      sound = false
      startTime = 0.0
      alpha = 0.9
      contentURL = url
    }
    
    
  }



