//
//  News.swift
//  SlideMenu
//
//  Created by Mathieu Janneau on 13/03/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import Foundation
import UIKit
enum Category {
  case photo,threeD,graphic
}
struct News {
  var title: String
  var image: UIImage
  var category: Category
  
  init(title:String,image:String,category:Category){
    self.title = title
    self.image = UIImage(named:image)!
    self.category = category
  }
  
  static func fetchNews() -> [News] {
    return [
      
      News(title:"Captivating Geometric Origamis",image:"Blue-Origami-320x207",category:.graphic),
      News(title:"Digital Artist Creates an Artwork A Day..."
        ,image:"beeple-crap-art-renders-13-320x207",category:.threeD),
      News(title:"Futuristic, Colour-Infused Captures of...",image:"local-preacher-ghetto-streets-acid-photography-10-320x207",category:.photo),
      News(title:"Radiant And Harmonious 3D Illustrations",image:"FredP2-320x207",category:.threeD),
      News(title:"Evocative And Playful Collages by Émir...",image:"Eshiro2-3-320x207",category:.graphic),
      News(title:"Pastel Colours, Fruits & Disco...",image:"Little-Drill-Insta14-320x207",category:.graphic),
      News(title:"Beautiful Illustrations of the 2018...",image:"Gary-Oldman",category:.graphic),
      News(title:"Rowing Photo",image:"fubiz-expedia-city-hybrids-06-320x207",category:.threeD),
      News(title:"Amazing Hybrid Cities for Expedia",image:"Rowing",category:.photo),
      
      News(title:"Realistic Illustrations About Social...",image:"Loser",category:.threeD)
    ]
  }
}
