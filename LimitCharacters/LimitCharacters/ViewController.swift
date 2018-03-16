//
//  ViewController.swift
//  LimitCharacters
//
//  Created by Mathieu Janneau on 16/03/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
  
  @IBOutlet weak var textView: UITextView!
  @IBOutlet weak var characterCounter: UILabel!
  @IBOutlet weak var profilImage: UIImageView!
  
 
  override func viewDidLoad() {
    super.viewDidLoad()
    profilImage.layer.cornerRadius = profilImage.frame.width / 2
    profilImage.layer.masksToBounds = true
    textView.delegate = self
    
    //Observe when keyboard appears and trigger the animation up
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  }

// MARK: - Keyboard actions

extension ViewController {
  @objc func keyboardWillShow(notification: NSNotification){
    if let info = notification.userInfo{
      //grab CGRect size of keybaord
      let rect : CGRect = info["UIKeyboardFrameEndUserInfoKey"] as! CGRect
      self.view.layoutIfNeeded()
      let duration = (info[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
      //animating stack view up
      UIView.animate(withDuration: duration , animations: {
        self.view.layoutIfNeeded()
        //self.topView.isHidden = true
        self.bottomConstraint.constant = rect.height
      })
    }
  }
  
  /// Animate the StackView in initail position/layout when keyboard disappear
  func resetStackViewToOriginal() {
    UIView.animate(withDuration: 0.25 , animations: {
      
      self.bottomConstraint.constant = 0
      self.view.layoutIfNeeded()
    })}
}

extension ViewController: UITextViewDelegate {
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    resetStackViewToOriginal()
    self.view.endEditing(true)
  }
  
  func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    
    let label = UILabel()
    let newFrame = CGRect(x: 0, y: textView.frame.height - 30, width: textView.frame.width, height: 30.0)
    label.frame = newFrame
    label.textColor = .white
    label.text = "You reached the characer limit"
    
    if let myTextViewString = textView.text
    {characterCounter.text = "\(myTextViewString.count)/140"
      if myTextViewString.count == 140 {
        textView.addSubview(label)
      }
    if range.length > 140{
      
      return false
    }
      
      let newLength = myTextViewString.count + range.length
      
      return newLength < 140
    }
    
    return true
    
  
    
  }
  
}




