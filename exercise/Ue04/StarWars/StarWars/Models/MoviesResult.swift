//
// Created by Andreas Wenzelhuemer on 10.01.23.
//

import Foundation

struct MoviesResult: Codable {
    let count: Int
    let results: [MoviesModel]
    let next: Int?
    let previous: Int?
}
