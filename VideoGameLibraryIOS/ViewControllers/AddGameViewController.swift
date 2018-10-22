//
//  AddGameViewController.swift
//  VideoGameLibraryIOS
//
//  Created by Jake Dillon on 10/17/18.
//  Copyright © 2018 Jake Dillon. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    let genres = ["Action", "RPG", "Puzzle", "Racing"]
    
    @IBOutlet weak var gameTitle: UILabel!
    
    @IBOutlet weak var gameTitleTextField: UITextField!
    
    @IBOutlet weak var gameDescription: UILabel!
    
    @IBOutlet weak var gameDescriptionTextField: UITextView!
    
    @IBOutlet weak var ratingChoiceLabel: UILabel!
    
    @IBOutlet weak var ratingChoice: UISegmentedControl!
    
    @IBOutlet weak var genreChoiceLabel: UILabel!
    
    @IBOutlet weak var genreChoice: UIPickerView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    // submits new game
    @IBAction func submitButtonTapped(_ sender: Any) {
        guard let title = gameTitleTextField.text, title.trimmingCharacters(in: .whitespacesAndNewlines) != "", let gameDescription = gameDescriptionTextField.text, title.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
            return
        }
        
        var rating: String!
        switch ratingChoice.selectedSegmentIndex {
        case 0:
            rating = "E"
        case 1:
            rating = "E-10"
        case 2:
            rating = "T"
        case 3:
            rating = "M"
        case 4:
            rating = "AO"
        default:
            rating = "E"
            
        }
        let genre = genres[genreChoice.selectedRow(inComponent: 0)]
        
        let newGame = Game(title: title, description: gameDescription, genre: genre, rating: rating)
        
        GameManager.sharedInstance.addGame(game: newGame)
        
        self.performSegue(withIdentifier: "unwindToGameList", sender: self)
        
    }
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return genres[row]
        }
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return genres.count
        }
    
}



