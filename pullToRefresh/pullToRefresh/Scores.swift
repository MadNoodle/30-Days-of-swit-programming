//
//  Scores.swift
//  pullToRefresh
//
//  Created by Mathieu Janneau on 04/03/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import Foundation

struct Scores {
  var game: String
  var score: String
  
  static func fetchScores() -> [Scores]{
  return [
    Scores(game: "RedStar FC - Béziers", score: "0 - 1"),
    Scores(game: "Rodez - Béziers - Entente SSG", score: "1 - 0"),
    Scores(game: "Avranches - Lyon la duchère", score: "3 - 3"),
    Scores(game: "Marseille Consolat - Pau", score: "0 - 1"),
    Scores(game: "Dunkerque FC - Les herbiers", score: "1 - 2")
  ]
  }
  static func fetchNewScores(scores : [Scores]) ->[Scores] {
    
    var updatedScores = scores
    
    let newScores = [
      Scores(game: "PSG - Caen", score: "6 - 0"),
      Scores(game: "Nantes - Lyon ", score: "1 - 0"),
      Scores(game: "Tours - Bordeaux", score: "0 - 3")
    ]
    
    for newScore in newScores {
      updatedScores.append(newScore)
    }
    
    return updatedScores
  }
}
