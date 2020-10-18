//
//  Squad.swift
//  Athletes
//
//  Created by Michael Slattery on 10/17/20.
//

import Foundation

struct Squads: Codable {
    let squads: [Squad]
}

struct Squad: Codable {
    let createdAt: String
    let id: Int
    let name: String
    let organisationId: Int
    let updatedAt: String
}
