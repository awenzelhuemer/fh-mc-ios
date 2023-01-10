//
// Created by Andreas Wenzelhuemer on 10.01.23.
//

import Foundation

class MoviesApi {

    static func getMovies() async throws -> [MoviesModel] {
        (try await getData(url: "https://swapi.dev/api/films") as MoviesResult).results
    }

    static func getPlanet(url: String) async throws -> PlanetsModel {
        (try await getData(url: url) as PlanetsModel)
    }

    private static func getData<T: Codable>(url: String) async throws -> T {
        let session = URLSession.shared

        guard let url = URL(string: url) else {
            throw ApiError("Could not create URL")
        }

        let (data, response) = try await session.data(from: url)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw ApiError("The server responded with an error.")
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        guard let result = try? decoder.decode(T.self, from: data) else {
            throw ApiError("The server response was not recognized.")
        }
        return result
    }
}