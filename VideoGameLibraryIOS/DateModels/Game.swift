//
//  Game.swift
//  VideoGameLibraryIOS
//
//  Created by Jake Dillon on 10/18/18.
//  Copyright © 2018 Jake Dillon. All rights reserved.
//

import Foundation

class Game {
    var title: String
    var description: String
    var genre: String
    var rating: String
    var dueDate: Date?
    var checkedIn: Bool = true
    
    init(title: String, description: String, genre: String, rating: String) {
        self.title = title
        self.description = description
        self.genre = genre
        self.rating = rating
    }
}
