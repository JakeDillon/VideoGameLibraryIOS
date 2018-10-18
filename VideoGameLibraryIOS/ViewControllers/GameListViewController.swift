//
//  GameListViewController.swift
//  VideoGameLibraryIOS
//
//  Created by Jake Dillon on 10/15/18.
//  Copyright © 2018 Jake Dillon. All rights reserved.
//

import UIKit

class GameListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameManager.sharedInstance.getGameCount()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell") as! GameTableViewCell
        
        let currentGame = GameManager.sharedInstance.getGame(at: indexPath.row)
        
        cell.titleLabel.text = currentGame.title
        cell.genreLabel.text = currentGame.genre
        cell.ratingLabel.text = currentGame.rating
        
        if currentGame.checkedIn {
            cell.statusView.backgroundColor = UIColor.green
        } else {
            cell.statusView.backgroundColor = UIColor.red
        }
        
        
        // If the game has a due date, we want to format it into a String and display it on a dueDateLabel
        if let dueDate = currentGame.dueDate {
            cell.dueDateLabel.text = formatDate(dueDate)
        } else {
            cell.dueDateLabel.text = ""
        }
        
        
        return cell
    }
    
    @IBAction func unwindToGameList(segue: UIStoryboardSegue) { }
}

