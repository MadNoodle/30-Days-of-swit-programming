//
//  Data.swift
//  TumblerMenu
//
//  Created by Mathieu Janneau on 14/03/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import Foundation
import UIKit

struct Data {
  
  var picture: String
  var comment: String
  var tagTitle: String
  
  init(picture:String,comment:String,tagTitle:String){
    self.picture = picture
    self.comment = comment
    self.tagTitle = tagTitle
  }
  
  static func getData() -> [Data] {
  return [
    Data(picture:"1",comment:"Having Fun with Friends",tagTitle:"#FriendsTrip #who's your Daddy"),
    Data(picture:"2",comment:"I Love myself",tagTitle:"#who's your Daddy"),
    Data(picture:"3",comment:"SiSi la famille",tagTitle:"#2DArt"),
  Data(picture:"4",comment:"Renting a cool house for Holydays",tagTitle:"#AirBnb")
  ]
  }
}
