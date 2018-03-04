//
//  ScoreCell.swift
//  pullToRefresh
//
//  Created by Mathieu Janneau on 04/03/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import UIKit

class ScoreCell: UITableViewCell {

  @IBOutlet weak var match: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
