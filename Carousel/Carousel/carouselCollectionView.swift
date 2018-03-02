//
//  carouselCollectionView.swift
//  Carousel
//
//  Created by Mathieu Janneau on 02/03/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//


import UIKit

class carouselCollectionView: UIViewController {
  @IBOutlet weak var collectionView: UICollectionView!
  
  var musicAlbums = MusicAlbum.fetchMusic()
  
  let cellScaling:CGFloat = 0.6
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.dataSource = self
  }
}

extension carouselCollectionView : UICollectionViewDataSource{
  func  numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return musicAlbums.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "musicAlbumCell", for: indexPath) as! MusicAlbumCell
    cell.album = musicAlbums[indexPath.item]
    return cell
  }
  
}
