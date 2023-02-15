//
//  Current.swift
//  Project5
//
//  Created by Emre Bakır on 23.12.2022.
//

import UIKit

class Current: NSObject, Codable {
    var word = String()
    var entries = [String]()
    
    init(word: String, entries: [String]) {
        self.word = word
        self.entries = entries
    }
}
