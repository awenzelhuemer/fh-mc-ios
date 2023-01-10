//
//  main.swift
//  NetworkingTest
//
//  Created by Andreas Wenzelhuemer on 10.01.23.
//
//

import Foundation

if let url = URL(string: "https://goo.gl/wV9G4I") {

    let session = URLSession.shared

    let request = URLRequest(url: url)

    // Closure syntax
    let dataTask = session.dataTask(with: request) { (data, response, error) in
        if let error = error {
            print(error)
        }
        guard let data = data else {
            fatalError("no data")
        }
        // let image = UIImage(data: data)
    }

    dataTask.resume()

    // Async Await
    Task {
        let (data, response) = try await session.data(for: request)
        // let image = UIImage(data: data)
    }
}
