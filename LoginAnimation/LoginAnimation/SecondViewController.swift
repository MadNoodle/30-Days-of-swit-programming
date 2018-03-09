//
//  SecondViewController.swift
//  LoginAnimation
//
//  Created by Mathieu Janneau on 09/03/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

  @IBOutlet weak var passwordButtonConstraint: NSLayoutConstraint!

  
  @IBOutlet weak var mailButtonConstraint: NSLayoutConstraint!
  

  @IBOutlet weak var goButtonConstraint: NSLayoutConstraint!
  
  @IBOutlet weak var goButton: UIButton!
  @IBOutlet weak var goButtonOutConstraint: NSLayoutConstraint!

  
  override func viewDidLoad() {
        super.viewDidLoad()
    goButton.layer.cornerRadius = 5.0
    setInitialConstraint()

    }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    UIView.animate(withDuration: 0.5,delay: 0, options: .curveEaseOut, animations: {
      self.mailButtonConstraint.constant += (self.view.bounds.width - 36)

      self.view.layoutIfNeeded()
    }, completion: nil)
    
    UIView.animate(withDuration: 0.5,delay: 0.2, options: .curveEaseOut, animations: {
      self.passwordButtonConstraint.constant += (self.view.bounds.width - 36)

      self.view.layoutIfNeeded()
    }, completion: nil)
    UIView.animate(withDuration: 0.5,delay: 0.4, options: .curveEaseOut, animations: {
      self.goButtonConstraint.constant += self.view.bounds.width
      self.goButtonOutConstraint.constant -= self.view.bounds.width
      self.view.layoutIfNeeded()
    }, completion: nil)
  }

  fileprivate func setInitialConstraint() {
    mailButtonConstraint.constant -= view.bounds.width

    passwordButtonConstraint.constant -= view.bounds.width

    goButtonConstraint.constant -= view.bounds.width
    goButtonOutConstraint.constant += view.bounds.width
  }

}
