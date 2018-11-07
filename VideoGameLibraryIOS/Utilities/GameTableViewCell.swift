//
//  GameTableViewCell.swift
//  VideoGameLibraryIOS
//
//  Created by Jake Dillon on 10/16/18.
//  Copyright © 2018 Jake Dillon. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    // title label
    @IBOutlet weak var titleLabel: UILabel!
    // genre label
    @IBOutlet weak var genreLabel: UILabel!
    //label to show due date
    @IBOutlet weak var dueDateLabel: UILabel!
    // shows rating
    @IBOutlet weak var ratingLabel: UILabel!
    // this shows if checked out or not
    @IBOutlet weak var statusLabel: UIView!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
