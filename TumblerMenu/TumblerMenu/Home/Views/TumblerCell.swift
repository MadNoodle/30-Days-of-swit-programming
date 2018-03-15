//
//  TumblerCell.swift
//  TumblerMenu
//
//  Created by Mathieu Janneau on 14/03/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit

class TumblerCell: UITableViewCell {

  @IBOutlet weak var picture: UIImageView!
  
  @IBOutlet weak var tagTitle: UILabel!
  @IBOutlet weak var comment: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
