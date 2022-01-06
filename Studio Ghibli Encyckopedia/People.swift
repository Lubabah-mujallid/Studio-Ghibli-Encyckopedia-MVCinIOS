//
//  People.swift
//  Studio Ghibli Encyckopedia
//
//  Created by administrator on 06/01/2022.
//

import Foundation


//struct People: Codable {
//    var id: String
//    var name: String
//    var gender: String
//    var age: String
//}


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
struct Person: Codable {
    let id, name: String
    let gender: Nder?
    let age, eyeColor, hairColor: String
    let films: [String]
    let species, url: String
    let gander: Nder?

    enum CodingKeys: String, CodingKey {
        case id, name, gender, age
        case eyeColor = "eye_color"
        case hairColor = "hair_color"
        case films, species, url, gander
    }
}

enum Nder: String, Codable {
    case female = "Female"
    case male = "Male"
    case na = "NA"
}

typealias People = [Person]
