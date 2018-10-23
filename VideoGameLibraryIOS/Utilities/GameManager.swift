//
//  GameManager.swift
//  VideoGameLibraryIOS
//
//  Created by Jake Dillon on 10/17/18.
//  Copyright © 2018 Jake Dillon. All rights reserved.
//

import Foundation


class GameManager {
    //Shared instance of the GameManager class
    static let sharedInstance = GameManager()
    
    //We are creating a private initializer so that no instances of this class can be made anywhere else
    private init() {
        gameArray[0].dueDate = Date()
    }
    
    //The array of games that will be used throughout the application
    private var gameArray = Results<Game>!
    
    //referance to the local realm database
    let realm = try! Realm()
    
    //Function to get the number of games we have
    func getGameCount() -> Int {
        return gameArray.count
    }
    
    //Function to return a game at a specific index
    func getGame(at index: Int) -> Game {
        return gameArray[index]
    }
    
    //Function to add a game to the game library
    func addGame(game: Game) {
        gameArray.append(game)
    }
    // Function to remove games from library
    //function to remove a game from a library
    func removeGame(at index: Int) {
        try! realm.write {
            realm.delete(getGame(at: index))
        }
    }
    
    //function to check in or out a game
    func checkGameInOrOut(at index: Int) {
        let gameForIndex = gameArray[index]
        try! realm.write {
            gameForIndex.checkedIn = !gameForIndex.checkedIn
            
            if gameForIndex.checkedIn {
                gameForIndex.dueDate = nil
            } else {
                gameForIndex.dueDate = Calendar.current.date(byAdding: .day, value: 14, to: Date())
            }
        }
    }
}



