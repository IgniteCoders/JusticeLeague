//
//  SuperheroResponse.swift
//  JusticeLeague
//
//  Created by Tardes on 18/12/24.
//

import Foundation

struct SuperheroResponse: Codable {
    let results: [Superhero]
}

struct Superhero: Codable {
    let id: String
    let name: String
}
