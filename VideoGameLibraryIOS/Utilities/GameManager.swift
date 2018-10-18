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
    private var gameArray = [Game(title: "Far Cry 5", description: "", genre: "Shooter", rating: "M"), Game(title: "WWE 2K19", description: "", genre: "Fighting", rating: "T"), Game(title: "Def Jam Vendetta", description: "", genre: "Fighting", rating: "T")]
    
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
    func removeGame(at index: Int) {
        gameArray.remove (at: index)
    }
    func checkGamedInOrOut(at index: Int) {
        let gameForIndex = gameArray[index]
        gameArray[index].checkedIn = !gameArray[index].checkedIn
        
        if gameForIndex.checkedIn {
            // remove any existing due date
        } else {
            // add a new due date, since the game has just been checked out
            gameForIndex.dueDate = Calendar.current.date(byAdding: .day, value: 14, to: Date())
        }
    
    }
}



