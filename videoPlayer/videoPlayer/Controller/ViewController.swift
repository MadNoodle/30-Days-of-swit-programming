//
//  ViewController.swift
//  videoPlayer
//
//  Created by Mathieu Janneau on 28/02/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
  
  // MARK: - Data
  
  let movies = Data.movies
  
  // MARK: - LIFECYCLE METHODS
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollection()
  }
  
  // MARK: - COLLECTION VIEW
  // cells info
  let cellNib = UINib(nibName: "videoThumbnailCollectionViewCell", bundle: nil)
  let cellId = "videoCell"
  @IBOutlet weak var videoCollection: UICollectionView!
  fileprivate func setupCollection() {
    videoCollection.delegate = self
    videoCollection.dataSource = self
    videoCollection.register(cellNib, forCellWithReuseIdentifier: cellId)
    videoCollection.reloadData()
  }
  
  // MARK: - PLAYER METHODS
  // Video player
  var avPlayer = AVPlayer()
  var playerViewcontroller = AVPlayerViewController()
  fileprivate func playLocalVideo(url: String) {
    let fileUrl = URL(fileURLWithPath:url)
    avPlayer = AVPlayer(url: fileUrl)
    presentPlayer()
  }
  
  
  fileprivate func presentPlayer() {
    playerViewcontroller.player = avPlayer
    self.present(playerViewcontroller, animated: true) {
      self.playerViewcontroller.player?.play()
    }
  }
  
  
  fileprivate func playDistantVideo(url: String) {
    let fileUrl = URL(string:url)
    avPlayer = AVPlayer(url: fileUrl!)
    presentPlayer()
  }
  
}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return movies.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? VideoThumbnailCollectionViewCell
    let currentMovie = movies[indexPath.row]
    
    cell?.thumbnail.image = UIImage(named: currentMovie.thumbnail)
    cell?.videoTitle.text = currentMovie.title
    return cell!
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let currentMovie = movies[indexPath.row]
    if currentMovie.source == .local
    {
      playLocalVideo(url: currentMovie.url)
    }
    else {
      playDistantVideo(url: currentMovie.url)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    let height = 240
    return CGSize(width:collectionView.bounds.size.width,height: CGFloat(height))
  }
  
}

