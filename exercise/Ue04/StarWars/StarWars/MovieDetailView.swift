//
//  MovieDetailView.swift
//  StarWars
//
//  Created by Andreas Wenzelhuemer on 10.01.23.
//
//

import SwiftUI

struct MovieDetailView: View {

    var movie: MoviesModel
    @Binding var planets: [PlanetsModel]
    @State var currentPlanets: [String] = []

    var body: some View {
        NavigationStack {
            List {
                Section {
                    Text("Release Date: \(movie.releaseDate)")
                    Text("Director: \(movie.director)")
                    Text("Producer: \(movie.producer.count)")
                    Text("Characters: \(movie.characters.count)")
                    Text("Starships: \(movie.starships.count)")
                } header: {
                    Text("Details")
                }
                Section {
                    ForEach(currentPlanets, id: \.self) { planet in
                        Text(planet)
                    }
                } header: {
                    Text("Planets")
                }
            }
        }
                .navigationBarTitle(movie.title)
                .navigationBarTitleDisplayMode(.inline).onAppear(perform: {
                    Task {
                        try await loadPlanets()
                    }
                })
    }

    private func loadPlanets() async throws {
        for planetUrl in movie.planets {
            var planet = planets.first(where: { $0.url == planetUrl })
            if planet == nil {
                planet = try await MoviesApi.getPlanet(url: planetUrl)
                planets.append(planet!)
            }
            currentPlanets.append(planet!.name)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(
                movie: MoviesModel(
                        title: "Title",
                        id: 1,
                        openingCrawl: "Once upon a time",
                        director: "Guy Ritchy",
                        producer: "Nobody",
                        releaseDate: "Today",
                        characters: [],
                        planets: [],
                        starships: [],
                        vehicles: [],
                        species: [],
                        created: "Today",
                        edited: "Today",
                        url: "www.test.com"),
                planets: .constant([]))
    }
}
