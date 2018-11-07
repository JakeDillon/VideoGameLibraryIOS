//
//  Game.swift
//  VideoGameLibraryIOS
//
//  Created by Jake Dillon on 10/18/18.
//  Copyright © 2018 Jake Dillon. All rights reserved.
//

import Foundation
import RealmSwift


class Game: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var gameDescription: String = ""
    @objc dynamic var genre: String = ""
    @objc dynamic var rating: String = ""
    @objc dynamic var dueDate: Date? = nil
    @objc dynamic var checkedIn: Bool = true
    
    
}
