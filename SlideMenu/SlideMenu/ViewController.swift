//
//  ViewController.swift
//  SlideMenu
//
//  Created by Mathieu Janneau on 13/03/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let menu = Menu()
  var data = [News]()
  var state:Bool = false
  @IBOutlet weak var tabelView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    data = News.fetchNews()
    tabelView.dataSource = self
    tabelView.register(UINib(nibName:"NewsTableViewCell",bundle: nil), forCellReuseIdentifier: "cellId")
    tabelView.reloadData()
  }
  

  @IBAction func userDidPressMenu(_ sender: UIButton) {
    menu.showMenu()
  }
  
}
extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! NewsTableViewCell
    cell.titleLabel.text = data[indexPath.row].title
    cell.thumbnailImage.image = data[indexPath.row].image
    return cell
  }
  
  
}
