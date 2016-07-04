let airports = [
    "YYZ": "Toronto Pearson",
    "DUB": "Dublin",
    "JFK": "John F. Kennedy International Airport",
]

if let airport = airports["YYZ"] {
    print("The abbreviation for \(airport) is YYZ")
}

if let airport = airports["DUB"] {
    print("The abbreviation for \(airport) is DUB")
}

if let airport = airports["JFK"] {
    print("The abbreviation for \(airport) is JFK")
}

for (key, value) in airports {
    print("The abbreviation for \(value) is \(key)")
}

for (airportCode, airportName) in airports {
    print("The abbreviation for \(airportName) is \(airportCode)")
}




let toyStoryFilms = [
    "Toy Story",
    "Toy Story 2",
    "Buzz Lightyear of Star Command: The Adventure Begins",
    "Toy Story 3",
    "Toy Story 4"
]

let starWarsFilms = [
    "Star Wars",
    "The Empire Strikes Back",
    "Star Wars: Episode VI",
    "Star Wars: Episode I",
    "Star Wars: Episode II",
    "Star Wars: Episode III",
    "Star Wars: The Clone Wars",
    "Star Wars: The Force Awakens",
    "Star Wars: Episode VIII",
    "Star Wars: Episode IX"
]

let fastAndFuriousFilms = [
    "The Fast and the Furious",
    "2 Fast 2 Furious",
    "Turbo-Charged Prelud",
    "Tokyo Drift",
    "Fast & Furious",
    "Los Bandoleros",
    "Fast Five",
    "Fast & Furious 6",
    "Furious 7",
    "Fast 8"
]

let movies = [
    "Star Wars": starWarsFilms,
    "Fast & Furious": fastAndFuriousFilms,
    "Toy Story": toyStoryFilms,
]

for (franchise, titles) in movies {
    print("There are \(titles.count) movies in the \(franchise) series")
}
