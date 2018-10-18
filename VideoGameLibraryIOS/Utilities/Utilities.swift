//
//  Utilities.swift
//  VideoGameLibraryIOS
//
//  Created by Jake Dillon on 10/18/18.
//  Copyright © 2018 Jake Dillon. All rights reserved.
//

import Foundation

func formatDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    
   // dateFormatter.dataStyle = .medium      This will allow you to set different default date styles

    formatter.dateFormat = " MMM d, yyyy"
    
    let formattedString = formatter.string(from: date)
    
    return formattedString
}
