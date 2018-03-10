//
//  data.swift
//  animatedTableView
//
//  Created by Mathieu Janneau on 09/03/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import Foundation

struct Show {
  let title:String
  let description: String
  let image: String
  
  init(title:String,description:String,image: String){
    self.title = title
    self.description = description
    self.image = image
  }
  
  static func getData() -> [Show] {
    return [
      Show(title: "Homeland", description: "A bipolar CIA operative becomes convinced a prisoner of war has been turned by al-Qaeda and is planning to carry out a terrorist attack on American soil.", image: "homeland"),
      Show(title: "Altered Carbon", description: "Set in a future where consciousness is digitized and stored, a prisoner returns to life in a new body and must solve a mind-bending murder to win his freedom.", image: "altered"),
      Show(title: "Game of Thrones", description: "Nine noble families fight for control over the mythical lands of Westeros, while an ancient enemy returns after being dormant for thousands of years.", image:"got"),
      Show(title: "Greys Anatomy", description: "A drama centered on the personal and professional lives of five surgical interns and their supervisors.", image: "greys"),
      Show(title: "Flash", description: "After being struck by lightning, Barry Allen wakes up from his coma to discover he's been given the power of super speed, becoming the Flash, fighting crime in Central City.", image: "flash"),
      Show(title: "Black Mirror", description: "An anthology series exploring a twisted, high-tech world where humanity's greatest innovations and darkest instincts collide.", image: "mirror"),
      Show(title: "Seven Secconds", description: "Tensions run high between African American citizens and Caucasian cops in Jersey City when a teenage African American boy is critically injured by a cop.", image: "seven"),
      Show(title: "Shameless", description: "An alcoholic man lives in a perpetual stupor while his six children with whom he lives with cope as best they can.", image: "shameless"),
      Show(title: "This is Us", description: "A heartwarming and emotional story about the most unique set of triplets and their struggles, and the wonderful parents who raised them.", image: "us"),
      Show(title: "Viking", description: "The world of the Vikings is brought to life through the journey of Ragnar Lothbrok, the first Viking to emerge from Norse legend and onto the pages of history - a man on the edge of myth.", image: "viking"),
      Show(title: "Walking Dead", description: "Sheriff Deputy Rick Grimes wakes up from a coma to learn the world is in ruins, and must lead a group of survivors to stay alive.", image: "zombie"),
      Show(title: "Arrow", description: "Spoiled billionaire playboy Oliver Queen is missing and presumed dead when his yacht is lost at sea. He returns five years later a changed man, determined to clean up the city as a hooded vigilante armed with a bow.", image: "arrow")
    ]
  }
  
}

