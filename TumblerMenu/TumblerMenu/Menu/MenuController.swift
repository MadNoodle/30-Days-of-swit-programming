//
//  MenuController.swift
//  TumblerMenu
//
//  Created by Mathieu Janneau on 14/03/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit

class MenuController: UIViewController, UIViewControllerTransitioningDelegate {
  let transitionManager = TransitionManager(state: .present)
 
  
  @IBOutlet weak var textPostIcon: UIImageView!
  @IBOutlet weak var textPostLabel: UILabel!
  
  @IBOutlet weak var photoPostIcon: UIImageView!
  @IBOutlet weak var photoPostLabel: UILabel!
  
  @IBOutlet weak var quotePostIcon: UIImageView!
  @IBOutlet weak var quotePostLabel: UILabel!
  
  @IBOutlet weak var linkPostIcon: UIImageView!
  @IBOutlet weak var linkPostLabel: UILabel!
  
  @IBOutlet weak var chatPostIcon: UIImageView!
  @IBOutlet weak var chatPostLabel: UILabel!
  
  @IBOutlet weak var audioPostIcon: UIImageView!
  @IBOutlet weak var audioPostLabel: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Do any additional setup after loading the view.
    }


  @IBAction func userDidCancel(_ sender: UIButton) {
    print("output")
    self.transitioningDelegate = self
    dismiss(animated: true)
  }
  
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    print("callback")
    return transitionManager
  }

}
