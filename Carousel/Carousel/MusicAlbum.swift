//
//  MusicAlbum.swift
//  Carousel
//
//  Created by Mathieu Janneau on 02/03/2018.
//  Copyright © 2018 Mathieu Janneau. All rights reserved.
//

import Foundation

struct MusicAlbum {
  var coverName:String
  var artist:String
  var title:String
  var year:Int
  
  static func fetchMusic() -> [MusicAlbum] {
    return [
      MusicAlbum(coverName:"velvet", artist: "The Velvet Underground and Nico", title: "The Velvet Underground & Nico",year: 1967),
      MusicAlbum(coverName:"beatles", artist: "The Beatles", title: "Abbey Road",year: 1969),
      MusicAlbum(coverName:"nirvana", artist: "Nirvana", title: "Nevermind",year: 1991),
      MusicAlbum(coverName: "beatles2", artist: "The Beatles", title: "Sgt. Pepper's Lonely Hearts Club Band", year: 1967),
      MusicAlbum(coverName: "bowie", artist: "David Bowie", title: "Aladdin Sane", year: 1973),
      MusicAlbum(coverName: "FKA", artist: "FKA Twigs", title: "LP1", year: 2014),
      MusicAlbum(coverName: "metalica", artist: "Metallica", title: "Master of puppets", year: 1986),
      MusicAlbum(coverName: "funkadelic", artist: "Funkadelic", title: "Maggot Brain", year: 1971),
      MusicAlbum(coverName: "Yeah-Yeah-Yeahs-Its-Blitz-album-covers-billboard-1000x1000", artist:"Yeah Yeah Yeahs" , title: "It's Blitz!", year: 2009),
      MusicAlbum(coverName: "greenDay", artist: "Green  Day", title: "American Idiot", year: 2004),
      MusicAlbum(coverName: "ohio", artist: "Ohio Players", title: "Honey", year: 1975)
    ]
  }
}
