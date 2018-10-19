//
//  AddGameViewController.swift
//  VideoGameLibraryIOS
//
//  Created by Jake Dillon on 10/17/18.
//  Copyright © 2018 Jake Dillon. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

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
    self.performSegue(withIdentifier: "unwindToGameList", sender: self)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        retrun 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 
    }
    
}

