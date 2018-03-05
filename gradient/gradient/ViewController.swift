//
//  ViewController.swift
//  gradient
//
//  Created by Mathieu Janneau on 05/03/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ViewController.createGradient), userInfo: nil, repeats: true)
  }
  
  @objc func createGradient(){
    let gradientSet =  generateGradientSet()
    gradientSet.forEach{
      let gradient = CAGradientLayer()
      gradient.frame = UIScreen.main.bounds
      gradient.colors = [$0.0,$0.1,$0.2,$0.3,$0.4]
      gradient.startPoint = CGPoint(x:0, y:0)
      gradient.endPoint = CGPoint(x:1, y:1)
      self.view.layer.addSublayer(gradient)
      animateGradient(gradient)
    }
  }
  
  func generateGradientSet() -> [(CGColor,CGColor,CGColor,CGColor,CGColor)]{
    var gradientSet: [(CGColor,CGColor,CGColor,CGColor,CGColor)] = []
    
    for _ in 0..<10 {
      let color1 = UIColor.getRandomColor().cgColor
      let color2 = UIColor.getRandomColor().cgColor
      let color3 = UIColor.getRandomColor().cgColor
      let color4 = UIColor.getRandomColor().cgColor
      let color5 = UIColor.getRandomColor().cgColor
      
      let gradientScheme = (color1,color2,color3,color4,color5)
      gradientSet.append(gradientScheme)
    }
    return gradientSet
    
  }

  
 private func animateGradient(_ gradient: CAGradientLayer) {
   
    let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
    gradientChangeAnimation.duration = 1.0
    gradientChangeAnimation.toValue = [
      UIColor.getRandomColor().cgColor,
      UIColor.getRandomColor().cgColor,UIColor.getRandomColor().cgColor,
      UIColor.getRandomColor().cgColor,UIColor.getRandomColor().cgColor
    ]
    gradientChangeAnimation.fillMode = kCAFillModeForwards
    gradientChangeAnimation.isRemovedOnCompletion = false
    gradient.add(gradientChangeAnimation, forKey: "colorChange")
  }
  


}

extension UIColor {

  static func getRandomColor() -> UIColor{
    
    let randomRed:CGFloat = CGFloat(drand48())
    
    let randomGreen:CGFloat = CGFloat(drand48())
    
    let randomBlue:CGFloat = CGFloat(drand48())
    
    return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
  }
  
}
