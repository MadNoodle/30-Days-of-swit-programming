//
//  videoThumbnailCollectionViewCell.swift
//  videoPlayer
//
//  Created by Mathieu Janneau on 28/02/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit

class VideoThumbnailCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var videoTitle: UILabel!
  @IBOutlet weak var thumbnail: UIImageView!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
