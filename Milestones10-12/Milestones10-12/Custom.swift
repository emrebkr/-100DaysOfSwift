//
//  Custom.swift
//  Milestones10-12
//
//  Created by Emre Bakır on 26.12.2022.
//

import UIKit

class Custom: NSObject, Codable {
    var filename: String
    var caption: String
    
    init(filename: String, caption: String) {
        self.filename = filename
        self.caption = caption
    }
}
