//
//  Athlete.swift
//  Athletes
//
//  Created by Michael Slattery on 10/17/20.
//

import Foundation

struct Athletes: Codable {
    let athletes: [Athlete]
}

struct Athlete: Codable {
    let firstName: String
    let lastName: String
    let id: Int
    let image: Image
    let username: String
    let squadIds: [Int]
}

struct Image: Codable {
    let url: String
}
