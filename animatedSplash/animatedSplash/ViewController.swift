//
//  ViewController.swift
//  animatedSplash
//
//  Created by Mathieu Janneau on 12/03/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
  // MARK: - PROPERTIES
  let mask = CALayer()

  @IBOutlet weak var sparta: UIImageView!
  @IBOutlet weak var screen: UIImageView!

  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupMask()
    // Wait for 2 sec to trigger the animation
    Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(bounce), userInfo: nil, repeats: false)
  }

  @objc func bounce(){
    // Scale factor mask overlay scale
    let scale: CGFloat = 50
    // remove the white spartan amsk
    self.sparta.alpha = 0
    
    // animation
    UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseInOut, animations: {
      self.view.layoutIfNeeded()
      self.mask.bounds = CGRect(x: 0, y: 0, width: 82 * scale, height: 142 * scale)
      }, completion: nil)

  }
  
  fileprivate func setupMask() {
    mask.contents = UIImage(named: "spartaMask")?.cgImage
    mask.contentsGravity = kCAGravityResizeAspect
    mask.bounds = CGRect(x: 0, y: 0, width: 82, height: 142)
    mask.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    mask.position = CGPoint(x: UIScreen.main.bounds.size.width / 2, y: UIScreen.main.bounds.size.height / 2)
    screen.layer.mask = mask
  }
}

