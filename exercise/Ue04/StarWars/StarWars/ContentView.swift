//
//  ContentView.swift
//  StarWars
//
//  Created by Andreas Wenzelhuemer on 10.01.23.
//
//

import SwiftUI

struct ContentView: View {

    @State private var movies: [MoviesModel] = []
    @State private var planets: [PlanetsModel] = []
    @State private var isLoading: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                if (isLoading) {
                    ProgressView()
                } else {
                    List(movies) { (movie) in
                        NavigationLink {
                            MovieDetailView(movie: movie, planets: $planets)
                        } label: {
                            Text(movie.title)
                        }
                    }
                }
            }
                    .navigationBarTitle(Text("Movies"))
                    .navigationBarTitleDisplayMode(.inline)
        }
                .onAppear(perform: {
                    Task {
                        do {
                            isLoading = true
                            movies = try await MoviesApi.getMovies()
                        } catch {
                            print(error)
                        }
                        isLoading = false
                    }
                })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
