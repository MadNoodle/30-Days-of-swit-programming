//
//  Movies.swift
//  videoPlayer
//
//  Created by Mathieu Janneau on 28/02/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import Foundation

enum Sources{
  case local,distant
}
class Movies {
  var thumbnail: String
  var url: String
  var title: String
  var source:Sources
  
  init(title:String, thumbnail:String, url: String,source:Sources){
    self.title = title
    self.thumbnail = thumbnail
    self.url = url
    self.source = source
  }
}
