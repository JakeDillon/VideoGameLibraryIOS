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
        cell.genreLabel.text = currentGame.title
        cell.ratingLabel.text = currentGame.rating
        cell.dueDateLabel.text = currentGame.title
        
        
        
        
        if currentGame.checkedIn {
            cell.statusLabel.backgroundColor = UIColor.green
        } else {
            cell.statusLabel.backgroundColor = UIColor.red
        }
        
        
        // If the game has a due date, we want to format it into a String and display it on a dueDateLabel
        if let dueDate = currentGame.dueDate {
            cell.dueDateLabel.text = formatDate(dueDate)
        } else {
            cell.dueDateLabel.text = ""
        }
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, _ in
            // Remove the game at the current index from our game array
            GameManager.sharedInstance.removeGame(at: indexPath.row)
            // Delete the row from the table view at the current index path
            tableView.deleteRows(at: [indexPath], with: .bottom)
        }
        let gameForIndex = GameManager.sharedInstance.getGame(at: indexPath.row)
        let title = gameForIndex.checkedIn ? "Checked Out" : "Checked In"
        let checkOutOrINAction = UITableViewRowAction(style: .normal, title: title) {
            _, _ in
            GameManager.sharedInstance.checkGameInOrOut(at: indexPath.row)
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
        return [deleteAction, checkOutOrINAction]
    }
    
    @IBAction func unwindToGameList(segue: UIStoryboardSegue) { }
}

