//
//  MusicAlbumCell.swift
//  Carousel
//
//  Created by Mathieu Janneau on 02/03/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit

class MusicAlbumCell: UICollectionViewCell {
  @IBOutlet weak var coverImage: UIImageView!
  
  @IBOutlet weak var artist: UILabel!
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var year: UILabel!
  
  var album : MusicAlbum? {
    didSet{
      self.updateUI()
    }
  }
  
  private func updateUI(){
    
    if let album = album {
      artist.text = album.artist
      title.text = album.title
      year.text = "\(album.year)"
      coverImage.image = UIImage(named: album.coverName)
    } else {
      artist.text = nil
      title.text = nil
      year.text = nil
      coverImage.image = nil
    }
  }
  
 override func layoutSubviews() {
    super.layoutSubviews()
    self.layer.cornerRadius = 20.0
  self.layer.shadowRadius = 2
  self.layer.shadowOpacity = 0.3
  self.layer.shadowOffset = CGSize(width: 5, height: 10)
  self.clipsToBounds = false
  
  }
}
