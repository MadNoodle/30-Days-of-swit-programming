//
//  ViewController.swift
//  animTableView
//
//  Created by Mathieu Janneau on 10/03/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
  
  //Init Data
  var data: [Show] = Show.getData()
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    tableView.reloadData()
  
  }
  
 // set status color to white
  override var preferredStatusBarStyle : UIStatusBarStyle {
    return UIStatusBarStyle.lightContent
  }
  
  // MARK: TableViewDataSource
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
    
    let current = data[indexPath.row]
      cell.poster.image = UIImage(named: current.image)
      cell.title.text = current.title
      cell.desc.text =  current.description
    return cell
  }
  
  // MARK: TableViewDelegate
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    // Initial State
    cell.alpha = 0
    let transform = CATransform3DTranslate(CATransform3DIdentity, -500, 0.0, 0.0)
    cell.layer.transform = transform
    
    // animation
    UIView.animate(withDuration: 1.0, delay: 0.05*Double(indexPath.row),options:.curveEaseInOut, animations: {
      cell.layer.transform = CATransform3DIdentity
      cell.alpha = 1
      
    })
  }
  
}

