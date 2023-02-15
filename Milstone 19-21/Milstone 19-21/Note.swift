//
//  Note.swift
//  Milstone 19-21
//
//  Created by Emre Bakır on 3.02.2023.
//

import UIKit

class Note: Codable {
    var title: String
    var date: String
    
    init(title: String, date: String) {
        self.title = title
        self.date = date
    }
}
