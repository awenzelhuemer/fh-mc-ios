//
// Created by Andreas Wenzelhuemer on 10.01.23.
//

import Foundation

struct PlanetsModel: Codable {
    let name: String
    let rotationPeriod: String
    let orbitalPeriod: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surfaceWater: String
    let population: String
    let residents: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name, diameter, climate, gravity, terrain, population,
             residents, films, created, edited, url, rotationPeriod,
             orbitalPeriod, surfaceWater
    }
}