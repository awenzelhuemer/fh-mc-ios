import Cocoa

// 1. Was versteht man unter Optionals?
// Optionals behandeln das Fehlen von Werten.
// Mittels ? kann angegeben werden, dass die Variable nil oder einen entsprechenden Wert enthalten kann.
// Mit ! kann trotzdem der Wert geforced werden
// Mittels optional binding kann auf den Wert zugegriffen werden, ohne dass ein Fehler bei Fehlen geworfen wird.

// 2. Star Wars Characters
var characters: [String: [Int]] = [
    "Luke Skywalker": [4,5,6],
    "Obi-Wan Kenobi": [1,2,3,4,5,6],
    "Darath Vader": [3,4,5,6]
]

var episodeTotal = 0

for character in characters {
    
    var line: String = "\(character.key) appeared in "
    let episodeCount = character.value.count
    episodeTotal += episodeCount
    line += (episodeCount == 6 ? "all episodes" : "\(episodeCount) episode")
    
    print(line)
    for episode in character.value {
        print("\t- Episode \(episode)")
    }
}

print("Average: \(round(Double(episodeTotal) / (Double(characters.count)) * 100) / 100.0 )")
