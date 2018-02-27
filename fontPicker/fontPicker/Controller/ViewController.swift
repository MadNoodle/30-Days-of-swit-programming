//
//  ViewController.swift
//  fontPicker
//
//  Created by Mathieu Janneau on 27/02/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var fontPicker: UIPickerView!
  
  var pickedFont: String?
  
  let fonts = ["Consola","Delm","MarkerFelt","ThirstySoftregular","Chalkboard","Chunk"]
  
  let dummyData = ["hello","world","this app changes font","using a picker view"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "textCell")
    tableView.reloadData()
  }

  @IBAction func changeFont(_ sender: UIButton) {
    tableView.reloadData()
  }
}

extension ViewController: UIPickerViewDelegate,UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return fonts.count
  }
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return fonts[row]
  }
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    pickedFont = fonts[row]
  }
  
  func PickedFontToPostScript(fontName:String) -> String {
    var postScriptFont = ""
    switch fontName {
    case "Consola":
      postScriptFont = "Consolas.ttf"
    case "Delm":
     postScriptFont = "Delm-Medium"
    case "MarkerFelt":
      postScriptFont = "MarkerFelt-Thin"
    case "ThirstySoftregular":
     postScriptFont = "ThirstySoftRegular"
    case "Chalkboard":
      postScriptFont = "Chalkboard"
    case "Chunk":
      postScriptFont = "ChunkFive.ttf"
    default: break
    }
    return postScriptFont
  }
}

extension ViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dummyData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath)
    cell.backgroundColor = #colorLiteral(red: 0.2588235294, green: 0.8039215686, blue: 0.768627451, alpha: 1)
    cell.textLabel?.text = dummyData[indexPath.row]
    cell.textLabel?.textColor = .white
    if pickedFont != nil
    {
      let newFont = PickedFontToPostScript(fontName: pickedFont!)
      cell.textLabel?.font = UIFont(name: newFont, size: 22.0)
    } else {
      cell.textLabel?.font = UIFont.systemFont(ofSize: 22.0)
    }
    return cell
  }
}


