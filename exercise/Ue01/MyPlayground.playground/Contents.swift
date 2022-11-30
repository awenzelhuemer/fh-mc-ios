import UIKit

var characters: [String: [Int]] = [
    "Luke Skywalker": [4,5,6],
    "Obi-Wan Kenobi": [1,2,3,4,5,6],
    "Darath Vader": [3,4,5,6]
]

print("Test")

let episodes = 6
var episodeTotal = 0

for character in characters {
    print("\(character) appeared in ")
    let episodeCount = character.value.count
    episodeTotal += episodeCount
    if episodeCount == episodes {
        print("all")
    } else {
        print(episodeCount)
    }
    print("episodes")
    for episode in character.value {
        print("- Episode \(episode)")
    }
}

// print("Average: ", episodeTotal / (episodes * 3))
