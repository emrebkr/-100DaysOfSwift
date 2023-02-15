//
//  Country.swift
//  Country Info
//
//  Created by Emre Bakır on 8.01.2023.
//

import Foundation

struct Country: Codable {
    var name: String
    var capital: String
    var region: String
    var population: Int
    var demonym: String
    var nativeName: String
}
