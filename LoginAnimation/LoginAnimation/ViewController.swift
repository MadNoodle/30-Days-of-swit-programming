//
//  ViewController.swift
//  LoginAnimation
//
//  Created by Mathieu Janneau on 09/03/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


  
  @IBOutlet var buttons: [UIButton]!
  override func viewDidLoad() {
    super.viewDidLoad()

    buttonsLayout()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
   
  }
  
  @IBAction func signUp(_ sender: Any) {
    let secondVc = SecondViewController(nibName: nil, bundle: nil)
    present(secondVc, animated: true, completion: nil)
  }
  
  func buttonsLayout(){
    for button in buttons {
      button.layer.cornerRadius = 5.0
    }
  }


}


