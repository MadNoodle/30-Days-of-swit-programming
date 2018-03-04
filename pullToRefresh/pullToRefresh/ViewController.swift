//
//  ViewController.swift
//  pullToRefresh
//
//  Created by Mathieu Janneau on 04/03/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
  @IBOutlet weak var tableView: UITableView!
  var scores = Scores.fetchScores()
  let refreshControl = UIRefreshControl()

  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupActivityIndicatorView()
    setupRefreshControl()
    tableView.reloadData()
  }
  
  private func setupActivityIndicatorView() {
    activityIndicatorView.isHidden = true
    activityIndicatorView.startAnimating()
  }
  
  private func setupRefreshControl() {
    tableView.refreshControl = refreshControl
    refreshControl.addTarget(self, action: #selector(ViewController.refreshData(sender:)), for: .valueChanged)
  }
  
  @objc func refreshData(sender: UIRefreshControl){
    scores = Scores.fetchNewScores(scores: scores)
    tableView.reloadData()
    tableView.refreshControl?.endRefreshing()
    activityIndicatorView.stopAnimating()
    
  }
}

extension ViewController: UITabBarDelegate, UITableViewDataSource{
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return scores.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "scoreCell", for: indexPath) as! ScoreCell
    cell.match.text = scores[indexPath.row].game
    cell.scoreLabel.text = scores[indexPath.row].score
    return cell
  }
  
}
