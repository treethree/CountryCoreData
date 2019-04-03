//
//  Country.swift
//  CountryCoreData
//
//  Created by SHILEI CUI on 4/2/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import Foundation
typealias CountryData = [CountryElement]

struct CountryElement: Codable {
    let name: String
    let topLevelDomain: [String]
    let alpha2Code, alpha3Code: String
    let callingCodes: [String]
    let capital: String
    let altSpellings: [String]
    let subregion: String
    let population: Int
    let latlng: [Double]
    let demonym: String
    let area, gini: Double?
    let timezones, borders: [String]
    let nativeName: String
    let numericCode: String?
    let flag: String
    let cioc: String?
}
