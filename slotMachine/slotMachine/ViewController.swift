//
//  ViewController.swift
//  slotMachine
//
//  Created by Mathieu Janneau on 10/03/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  // MARK: - PROPERTIES
  var emojis = [String]()
  var cylinderOne = [Int]()
  var cylinderTwo = [Int]()
  var cylinderThree = [Int]()
  
  // MARK: - OUTLETS
  @IBOutlet weak var picker: UIPickerView!
  @IBOutlet weak var playButton: UIButton!
  @IBOutlet weak var result: UILabel!
  
  
  fileprivate func buttonSetup() {
    playButton.layer.cornerRadius = 5.0
    playButton.layer.shadowColor = UIColor.black.cgColor
    playButton.layer.shadowOpacity = 0.4
    playButton.layer.shadowOffset = CGSize.zero
    playButton.layer.shadowRadius = 5
  }
  
  fileprivate func resultLabelSetup() {
    result.layer.shadowColor = UIColor.black.cgColor
    result.layer.shadowOpacity = 0.4
    result.layer.shadowOffset = CGSize.zero
    result.layer.shadowRadius = 5
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    buttonSetup()
    resultLabelSetup()
    picker.dataSource = self
    picker.delegate = self
    emojis = ["🦊","🐻","🐶","🐱","🐭","🐹","🐰","🐼","🐨","🦁","🐮","🐷"]
    result.text = ""
    populateCylinders()
  }

  @IBAction func userDidPressPlay(_ sender: UIButton) {
    roll()

  }
  // MARK: - CYlINDERS SETUP
  func randomNumber(_ number: Int) -> Int {
    return Int(arc4random_uniform((UInt32(number))))
  }
  func populateCylinders() {
    for _ in 0...100 {
      cylinderOne.append(randomNumber(12))
      cylinderTwo.append(randomNumber(12))
      cylinderThree.append(randomNumber(12))
    }
  }
  func roll() {
    for component in 0...2{
      self.picker.selectRow(randomNumber(12), inComponent: component, animated: true)
    }
    
    if (cylinderOne[picker.selectedRow(inComponent: 0)] == cylinderTwo[picker.selectedRow(inComponent: 1)] && cylinderTwo[picker.selectedRow(inComponent: 1)] == cylinderThree[picker.selectedRow(inComponent: 2)]){
      result.text = "YOU WIN!!!"
    }else {
     result.text = "PLAY AGAIN"
    }
    
  }
}

extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource{
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 3
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return emojis.count
  }
  
  func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
    return 100
  }
  func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
    return 100.0
  }
  
  func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
    let pickerLabel = UILabel()
    
    switch component {
    case 0:
      pickerLabel.text = emojis[cylinderOne[row]]
    case 1 :
      pickerLabel.text = emojis[cylinderTwo[row]]
    case 2:
      pickerLabel.text = emojis[cylinderThree[row]]
    default:
      break
    }
    
    pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 80)
    pickerLabel.textAlignment = .center
    return pickerLabel
  }
}
