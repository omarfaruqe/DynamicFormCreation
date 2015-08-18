//
//  Plyaer.swift
//  Ratings
//
//  Created by Caroline Begbie on 15/04/2015.
//  Copyright (c) 2015 Caroline Begbie. All rights reserved.
//

import Foundation

import UIKit

class Player: NSObject {
  var name: String
  var game: String
  var rating: Int
  
  init(name: String, game: String, rating: Int) {
    self.name = name
    self.game = game
    self.rating = rating
    super.init()
  }
}
