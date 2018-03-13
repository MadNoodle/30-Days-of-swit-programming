//
//  NewsTableViewCell.swift
//  SlideMenu
//
//  Created by Mathieu Janneau on 13/03/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var thumbnailImage: UIImageView!
  

  override func awakeFromNib() {
   
        super.awakeFromNib()
        // Initialization code
      titleLabel.layer.shadowColor = UIColor.black.cgColor
      titleLabel.layer.shadowRadius = 3.0
      titleLabel.layer.shadowOpacity = 0.5
      titleLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
      titleLabel.layer.masksToBounds = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
      
        // Configure the view for the selected state
    }
    
}
