//
// Created by Andreas Wenzelhuemer on 10.01.23.
//

import Foundation

struct MoviesModel: Codable, Identifiable {
    let title: String
    let id: Int
    let openingCrawl: String
    let director: String
    let producer: String
    let releaseDate: String
    let characters: [String]
    let planets: [String]
    let starships: [String]
    let vehicles: [String]
    let species: [String]
    let created: String
    let edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case title, director, producer,
             characters, planets, starships, vehicles,
             species, created, edited, url, openingCrawl, releaseDate
        case id = "episodeId"
    }
}