//
//  ViewController.swift
//  TumblerMenu
//
//  Created by Mathieu Janneau on 14/03/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var data: [Data] = Data.getData()
 
  @IBOutlet weak var tableView: UITableView!
  
  let transitionManager = TransitionManager(state: .present)
  
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UINib(nibName: "TumblerCell",bundle:nil), forCellReuseIdentifier: "cellId")
    tableView.reloadData()
  }
  
  @IBAction func userDidPressMenu(_ sender: UIBarButtonItem) {
    let menuVc = MenuController(nibName:nil,bundle:nil)
    menuVc.modalPresentationStyle = .overFullScreen
   menuVc.transitioningDelegate = self
    present(menuVc, animated: true, completion: nil)
  }
  
}

extension ViewController : UIViewControllerTransitioningDelegate{
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return transitionManager
  }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! TumblerCell
    cell.comment.text = data[indexPath.row].comment
    cell.picture.image = UIImage(named:data[indexPath.row].picture)
    cell.tagTitle.text = data[indexPath.row].tagTitle
    return cell
  }
}
